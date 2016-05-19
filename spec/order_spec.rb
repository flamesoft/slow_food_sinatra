describe Order do
  it { is_expected.to have_property :id }
  it { is_expected.to have_property :user_id }
  it { is_expected.to have_property :delivery_time }
  it { is_expected.to have_property :total_price }
  it { is_expected.to have_many :order_items }

end
