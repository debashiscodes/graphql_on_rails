QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root of this schema"

  field :user do
    type UserType

    argument :id, !types.ID

    description "Find a User by ID"

    resolve ->(obj, args, ctx) { User.find_by_id(args["id"]) }
  end

  field :post do
    type PostType

    argument :id, !types.ID

    description "Find a Post by ID"

    resolve ->(obj, args, ctx) { Post.find_by_id(args["id"]) }
  end
end
