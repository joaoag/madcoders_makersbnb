require 'data_mapper'

class Venue
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :address, String
  property :ppn, Integer
  property :description, Text

  belongs_to :user
  belongs_to :listing
end
