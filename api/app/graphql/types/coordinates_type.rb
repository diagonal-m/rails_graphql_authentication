# frozen_string_literal: true

module Types
  class CoordinatesType < Types::BaseObject
    field :latitude, Float, null: true
    field :longitude, Float, null: true

    def latitude
      object.first
    end
  
    def longitude
      object.last
    end
  end
end