module UserMutations
  Create = GraphQL::Relay::Mutation.define do
    name "AddUser"

    input_field :email, !types.String
    return_field :user, UserType

    resolve ->(object, inputs, ctx) {

      user = User.create(email: inputs[:email])

      if user.save
        { user: user }
      else
        { errors: user.errors.to_a }
      end
    }
  end
end
