Given(/^that following dishes exist in the system$/) do |table|
  table.hashes.each do |dish|
    Dish.create(name: dish[:name], price: dish[:price])
  end
end

Given(/^there are no dishes in the system$/) do
  Dish.all.each do |dish|
    dish.destroy
  end
end
