class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def edit?
    is_user_comment_owner?
  end

  def update?
    is_user_comment_owner?
  end

  def destroy?
    is_user_comment_owner?
  end

  private

  def is_user_comment_owner?
    @user === @comment.user
  end
end
