MutationType = GraphQL::ObjectType.define do
  name "Mutation"
  description "The mutation root"


  #### For User ####
  field :addUser, field: UserMutations::Create.field
  field :updateUser, field: UserMutations::Update.field
  field :destroyUser, field: UserMutations::Destroy.field

  #### For Post ####
  field :addPost, field: PostMutations::Create.field

end
