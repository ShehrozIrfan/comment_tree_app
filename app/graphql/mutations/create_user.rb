module Mutations
  class CreateUser < Mutations::BaseMutation
    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true
    argument :avatar, String, required: false, default_value: nil

    field :user, Types::UserType, null: true
    field :errors, [String], null: false

    def resolve(first_name:, last_name:, email:, password:, avatar:)
      user = User.new(first_name: first_name, last_name: last_name, email: email, password: password, password_confirmation: password, avatar: avatar)

      if user.save
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
