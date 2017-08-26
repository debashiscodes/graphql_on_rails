MutationType = GraphQL::ObjectType.define do
  name "Mutation"
  description "The mutation root"


  field :addUser, field: UserMutations::Create.field
  field :addPost, field: PostMutations::Create.field
  field :destroyUser, field: UserMutations::Destroy.field
end
