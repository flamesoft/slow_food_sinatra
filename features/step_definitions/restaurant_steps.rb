Given(/^that following restaurant information exists in the system$/) do |table|
  table.hashes.each do |restaurant|
    Restaurant.create(name: restaurant[:name], address: restaurant[:address], description: restaurant[:description])
  end
end
