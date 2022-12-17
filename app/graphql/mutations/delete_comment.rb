module Mutations
  class DeleteComment < Mutations::BaseMutation
    argument :id, ID, required: true

    field :comment, Types::CommentType, null: true
    field :error, String, null: true

    def resolve(id:)
      comment = Comment.find_by_id id
      if comment && comment.destroy
        {
          comment: comment,
          error: ""
        }
      else
        {
          comment: nil,
          error: comment.nil? ? "No comment exist with id: #{id}" : "Something went wrong. Please try again."
        }
      end
    end
  end
end
