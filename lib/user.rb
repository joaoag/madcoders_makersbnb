require 'data_mapper'
require_relative 'venue'
require_relative 'listing'

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
