# frozen_string_literal: true

module Types
  class CommentType < Types::BaseObject
    field :id, ID, null: false
    field :text, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :parent_id, Integer, null: true
    field :user_id, Integer, null: true
    field :responses, [Types::CommentType], null: true


    def responses
      object.responses
    end
  end
end
