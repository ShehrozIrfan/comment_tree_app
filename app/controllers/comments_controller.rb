class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :back, :show_reply_modal]

  def index
    @comments = Comment.where(parent_id: nil).order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to comments_path
    else
      render 'new'
    end
  end

  def show
    @comment = Comment.find_by(id: params[:id])
    @comment_responses = @comment.responses.paginate(page: params[:page], per_page: 5) if @comment.responses.any?
  end

  def edit
    @comment = current_user.comments.find_by(id: params[:id])

    if @comment.nil?
      flash[:warning] = "You don't have permissions to edit this comment."
      redirect_to root_path
    end
  end

  def update
    @comment = current_user.comments.find_by(id: params[:id])
    if @comment && @comment.update(comment_params)
      redirect_to @comment.parent_id.present? ? comment_path(@comment.parent_id) : comments_path
    else
      render 'edit'
    end
  end

  def destroy
    comment = current_user.comments.find_by(id: params[:id])
    if comment
      comment.destroy
      flash[:success] = "Commet deleted successfully."
    else
      flash[:danger] = "You don't have permissions to delete this comment."
    end
    redirect_to comments_path
  end

  def show_reply_modal
    @parent_comment = Comment.find_by(id: params[:id])
    @response = Comment.new
  end

  def reply
    @response = current_user.comments.new(reply_params[:comment])
    if @response.save
      redirect_to comment_path(reply_params[:comment][:parent_id])
    else
      respond_to do |format|
        format.json { render json: {errors: @response.errors.full_messages} }
      end
    end
  end

  def back
    parent_id = Comment.find_by(id: params[:id]).parent_id
    redirect_to parent_id.present? ? comment_path(parent_id) : comments_path
  end

  private

    def reply_params
      params.require(:data).permit(comment: [:parent_id, :text])
    end

    def comment_params
      params.require(:comment).permit(:text)
    end
end
