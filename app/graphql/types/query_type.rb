module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :comments,
    [Types::CommentType],
    null: false,
    description: "Returns a list of comments"

    field :users,
    [Types::UserType],
    null: false,
    description: "Returns a list of users"

    def comments
      Comment.all
    end

    def users
      User.all
    end
  end
end
