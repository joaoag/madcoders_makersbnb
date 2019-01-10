require 'data_mapper'

class Listing
  include DataMapper::Resource

  property :id, Serial
  property :start_date, Date
  property :end_date, Date

  has n, :venues

end
