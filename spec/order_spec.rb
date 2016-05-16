describe Order do
  it { is_expected.to have_property :id }
  it { is_expected.to have_property :user_id }
  it { is_expected.to have_property :delivery_time }
#  it { is_expected.to have_property(:order_items) }

end
