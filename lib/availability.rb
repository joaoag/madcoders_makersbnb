require 'data_mapper'

class Availability
  include DataMapper::Resource

  property :id, Serial
  property :start_date, Date
  property :end_date, Date

  belongs_to :venue
end
