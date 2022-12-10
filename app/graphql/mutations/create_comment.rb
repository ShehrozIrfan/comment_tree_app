module Mutations
  class CreateComment < Mutations::BaseMutation
    argument :text, String, required: true

    field :comment, Types::CommentType, null: true
    field :errors, [String], null: false

    def resolve(text:)
      comment = Comment.new(text: text)
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
