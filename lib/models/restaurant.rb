class Restaurant
  include DataMapper::Resource

  property :id, Serial, key: true
  property :address, String, length: 128
  property :name, String, length: 128
  property :description, String, length: 500


end
