class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :back, :show_reply_modal]
  def index
    @comments = Comment.where(parent_id: nil).order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end

  def new
    @comment = Comment.new
  end

  def create
    Comment.create(comment_params)
    redirect_to comments_path
  end

  def show
    @comment = Comment.find_by(id: params[:id])
    @comment_responses = @comment.responses.paginate(page: params[:page], per_page: 5) if @comment.responses.any?
  end

  def edit
    @comment = Comment.find_by(id: params[:id])
  end

  def update
    comment = Comment.find_by(id: params[:id])
    comment.update(comment_params) if comment
    redirect_to comment.parent_id.present? ? comment_path(comment.parent_id) : comments_path
  end

  def destroy
    comment = Comment.find_by(id: params[:id])
    comment.destroy if comment
    redirect_to comments_path
  end

  def show_reply_modal
    @parent_comment = Comment.find_by(id: params[:id])
    @response = Comment.new
  end

  def reply
    reply = Comment.create(reply_params)
    redirect_to comment_path(params[:comment][:parent_id])
  end

  def back
    parent_id = Comment.find_by(id: params[:id]).parent_id
    redirect_to parent_id.present? ? comment_path(parent_id) : comments_path
  end

  private

    def reply_params
      params.require(:comment).permit(:text, :parent_id)
    end

    def comment_params
      params.require(:comment).permit(:text)
    end
end
