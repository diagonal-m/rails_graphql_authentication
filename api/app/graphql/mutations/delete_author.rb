module Mutations
  class DeleteAuthor < BaseMutation
    graphql_name 'DeleteAuthor'
    field :author, Types::AuthorType, null: false
    
    argument :id, ID, required: true
    argument :first_name, String, required: false
    argument :last_name, String, required: false
    argument :yob, Integer, required: false
    argument :is_alive, Boolean, required: false

    def resolve(**args)
      author = Author.find_by(args[:id])
      author&.destroy!
      {
        author: author
      }
    end
  end
end
