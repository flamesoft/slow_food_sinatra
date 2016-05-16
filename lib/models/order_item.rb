class OrderItem
  include DataMapper::Resource

  property :id, Serial, key: true
  property :quantity, Integer
  property :dish_id, String, length: 128

  belongs_to :order, 'Order'

end
