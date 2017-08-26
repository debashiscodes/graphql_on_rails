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

  Destroy = GraphQL::Relay::Mutation.define do
    name 'DestroyUser'
    description 'Delete a user'

    input_field :id, !types.ID

    return_field :deletedId, !types.ID
    return_field :errors, types.String

    resolve ->(_obj, inputs, ctx) {
      user = User.find_by_id(inputs[:id])
      return { errors: 'User not found' } if user.nil?

      if user.destroy
        { deletedId: inputs[:id] }
      end
    }
  end
end
