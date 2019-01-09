require 'data_mapper'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password, BCryptHash

  has n, :venues

  def self.authenticate(email, password)
    user = first(email: email)
    return nil unless user

    user if user.password == password
  end
end

class Venue
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :address, String
  property :ppn, Integer
  property :description, Text

  belongs_to :user
end
