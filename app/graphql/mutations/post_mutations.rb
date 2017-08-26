module PostMutations
  Create = GraphQL::Relay::Mutation.define do
    name "AddPost"

    input_field :title, !types.String
    input_field :userId, !types.ID
    input_field :description, !types.String

    return_field :post, PostType
    return_field :errors, types.String

    resolve ->(object, inputs, ctx) {

      user = User.find_by_id(inputs[:userId])
      return { errors: 'User not found' } if user.nil?

      post = user.posts.create(title: inputs[:title], description: inputs[:description])

      if post.save
        { post: post }
      else
        { errors: user.errors.to_a }
      end
    }
  end
end
