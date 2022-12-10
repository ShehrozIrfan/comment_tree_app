module Types
  class MutationType < Types::BaseObject
    field :create_comment, mutation: Mutations::CreateComment
    field :delete_comment, mutation: Mutations::DeleteComment
    field :update_comment, mutation: Mutations::UpdateComment
  end
end
