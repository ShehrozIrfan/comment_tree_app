module Types
  class MutationType < Types::BaseObject
    field :create_comment, mutation: Mutations::CreateComment
  end
end
