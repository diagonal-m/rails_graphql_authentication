module Mutations
  class UpdateAuthor < BaseMutation
    graphql_name 'UpdateAuthor'
    field :author, Types::AuthorType, null: false
    
    argument :id, ID, required: true
    argument :first_name, String, required: false
    argument :last_name, String, required: false
    argument :yob, Integer, required: false
    argument :is_alive, Boolean, required: false

    def resolve(**args)
      author = Author.find_by(args[:id])
      author&.update!(args.to_h)
      {
        author: author
      }
    end
  end
end
