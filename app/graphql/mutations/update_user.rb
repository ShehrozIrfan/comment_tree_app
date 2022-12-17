module Mutations
  class UpdateUser < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :password, String, required: false, default_value: nil

    field :user, Types::UserType, null: true
    field :errors, [String], null: false

    def resolve(id:, first_name:, last_name:, password:)
      user = User.find_by_id id

      if user && user.update(first_name: first_name, last_name: last_name, password: password, password_confirmation: password)
        {
          user: user,
          errors: []
        }
      else
        {
          user: nil,
          errors: user.errors.full_messages
        }
      end
    end
  end
end
