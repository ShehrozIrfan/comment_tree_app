class Api::V1::CommentsController < ApiController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_comment, only: [:show]

  def index
    @comments = Comment.where(parent_id: nil).order(created_at: :desc)

    render json: { comments: @comments }
  end

  def show; end

  private

  def comment_params
    params.permit(:text)
  end

  def set_comment
    @comment = Comment.find_by_id params[:id]
  end
end
