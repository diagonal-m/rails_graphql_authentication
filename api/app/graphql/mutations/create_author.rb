module Mutations
  class CreateAuthor < BaseMutation
    graphql_name 'CreateAuthor'
    field :author, Types::AuthorType, null: false
      
    argument :first_name, String, required: false
    argument :last_name, String, required: false
    argument :yob, Integer, required: false
    argument :is_alive, Boolean, required: false

    def resolve(first_name:, last_name:, yob:, is_alive:)
      author = Author.create(
        first_name: first_name, last_name: last_name, yob: yob, is_alive: is_alive
      )
      {
        author: author
      }
    end
  end
end
