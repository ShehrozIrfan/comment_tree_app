class Api::V1::CommentsController < ApiController
  before_action :set_comment

  def show; end

  private

  def set_comment
    @comment = Comment.find_by_id params[:id]
  end
end
