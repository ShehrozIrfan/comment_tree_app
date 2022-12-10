module Mutations
  class UpdateComment < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :text, String, required: true

    field :comment, Types::CommentType, null: true
    field :errors, [String], null: true

    def resolve(id:, text:)
      comment = Comment.find_by_id id
      comment&.text = text
      if comment && comment.save
        {
          comment: comment,
          errors: nil
        }
      else
        {
          comment: nil,
          errors: comment.errors.full_messages
        }
      end
    end
  end
end
