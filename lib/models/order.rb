class Order
  include DataMapper::Resource

  property :id, Serial, key: true
  property :user_id, String, length: 128
  property :delivery_time, String, length: 128

  has n, :order_items, :child_key => [ 'id' ]

end
