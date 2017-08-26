module UserMutations
  Create = GraphQL::Relay::Mutation.define do
    name "AddUser"

    input_field :name, !types.String
    input_field :email, !types.String

    return_field :user, UserType
    return_field :errors, types.String

    resolve ->(object, inputs, ctx) {

      user = User.create(name: inputs[:name], email: inputs[:email])

      if user.save
        { user: user }
      else
        { errors: user.errors.to_a }
      end
    }
  end
end
