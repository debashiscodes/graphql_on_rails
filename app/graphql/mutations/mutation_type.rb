MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :addUser, field: UserMutations::Create.field
  field :addPost, field: PostMutations::Create.field
end
