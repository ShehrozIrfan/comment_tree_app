class CommentsController < ApplicationController

  def index
    @comments = Comment.all.order(created_at: :desc)
  end

  def new
    @comment = Comment.new
  end

  def create
    Comment.create(comment_params)
    redirect_to new_comment_path
  end

  def edit
    @comment = Comment.find_by(id: params[:id])
  end

  def update
    comment = Comment.find_by(id: params[:id])
    comment.update(comment_params) if comment
    redirect_to comments_path
  end

  def destroy
    comment = Comment.find_by(id: params[:id])
    comment.destroy if comment
    redirect_to comments_path
  end

  private

    def comment_params
      params.require(:comment).permit(:text)
    end
end
