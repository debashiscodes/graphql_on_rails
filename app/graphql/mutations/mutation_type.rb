MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :addUser, field: UserMutations::Create.field
end
