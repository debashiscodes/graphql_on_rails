UserType = GraphQL::ObjectType.define do
  name "User"

  field :id, types.Int
  field :name, types.String
  field :email, types.String
  field :posts, types[PostType]
end
