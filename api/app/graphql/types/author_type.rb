# frozen_string_literal: true

module Types
  class AuthorType < Types::BaseObject
    field :id, ID, null: false
    field :first_name, String
    field :last_name, String
    field :yob, Integer
    field :is_alive, Boolean
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :full_name, String, null: true
    def full_name
      "#{object.first_name} #{object.last_name}"
    end

    field :coordinates, Types::CoordinatesType, null: false
    field :publication_years, [Int], null: false
  end
end
