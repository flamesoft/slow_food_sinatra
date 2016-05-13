class Order_item
  include DataMapper::Resource

  property :id, Serial, key: true
  property :quantity, Integer
  property :dish_id, String, length: 128

end
