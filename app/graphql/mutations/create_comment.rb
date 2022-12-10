module Mutations
  class CreateComment < Mutations::BaseMutation
    argument :text, String, required: true
    argument :parent_id, ID, required: false, default_value: nil

    field :comment, Types::CommentType, null: true
    field :errors, [String], null: false

    def resolve(text:, parent_id:)
      comment = Comment.new(text: text, parent_id: parent_id)
      if comment.save
        # successful creation, returns the created object with no errors
        {
          comment: comment,
          errors: []
        }
      else
        # failed save, returns the errors
        {
          comment: nil,
          errors: comment.errors.full_messages
        }
      end
    end
  end
end
