module Mutations
  class DeleteUser < Mutations::BaseMutation
    argument :id, ID, required: true

    field :user, Types::UserType, null: true
    field :error, String, null: false

    def resolve(id:)
      user = User.find_by_id id

      if user && user.destroy
        {
          user: user,
          error: ""
        }
      else
        {
          user: nil,
          error: user.nil? ? "No user exist with id: #{id}" : "Something went wrong. Please try again."
        }
      end
    end
  end
end
