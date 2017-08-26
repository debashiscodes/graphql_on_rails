require 'rails_helper'

RSpec.describe GraphqlOnRailsSchema do
  let(:user) { create(:user) }
  let(:context) { { current_user: user } }
  let(:variables) { {} }
  let(:result) do
    GraphqlOnRailsSchema.execute(
      query_string,
      context: context,
      variables: variables
    )
  end

  describe "post" do
    let(:post) { create(:post, user: user) }
    let(:query_string) do
      %|
        query {
          post(id: #{post.id}) {
            id
          }
        }
      |
    end


    it "returns post" do
      expect(result["data"]["post"]["id"]).to eq(post.id)
    end
  end
end
