module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false, description: "An example field added by the generator" do
      argument :name, String, required: true
    end
    def test_field(name:)
      "Hello #{name}!"
    end

    field :author, Types::AuthorType, null: true do
      argument :id, ID, required: true
    end

    def author(id:)
      Author.find(id)
    end

    field :authors, [Types::AuthorType], null: false
    def authors
      Author.all
    end

    field :login, String, null: true do
      argument :email, String, required: true
      argument :password, String, required: true
    end
    def login(email:, password:)
      if user = User.find_by(email: email)&.authenticate(password)
        user.sessions.create.key
      end
    end

    field :current_user, Types::UserType, null: true
    def current_user
      context[:current_user]
    end
  end
end
