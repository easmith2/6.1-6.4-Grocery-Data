require 'faker'

items = [
  { name: 'Chicken Thighs', price_in_cents: 800, category: 'Poultry' },
  { name: 'Raisin Bran', price_in_cents: 450, category: 'Cereal' },
  { name: 'Orange Juice', price_in_cents: 760, category: 'Juice' },
  { name: 'Chicken Cutlets', price_in_cents: 760, category: 'Poultry' },
  { name: 'Wheat Bread', price_in_cents: 510, category: 'Grain' },
  { name: 'Toothbrush', price_in_cents: 199, category: 'Personal' },
  { name: 'Conditioner', price_in_cents: 1500, category: 'Personal' },
  { name: 'Deodorant', price_in_cents: 600, category: 'Personal' },
  { name: 'Tortilla Wraps', price_in_cents: 499, category: 'Grain' },
  { name: 'Salsa Dip', price_in_cents: 599, category: 'Dip' },
  { name: 'Queso Dip', price_in_cents: 799, category: 'Dip' },
  { name: 'Tortilla Chips', price_in_cents: 799, category: 'Chips' },
  { name: 'Broccoli', price_in_cents: 399, category: 'Vegetable' },
  { name: 'Banana Peppers', price_in_cents: 199, category: 'Vegetable' },
  { name: 'Jalapeño Peppers', price_in_cents: 299, category: 'Vegetable' },
  { name: 'Romaine', price_in_cents: 250, category: 'Vegetable' },
  { name: 'Baking Powder', price_in_cents: 560, category: 'Utility Ingredient' }
]

3.times do
  address = "#{Faker::Address.street_address}, #{Faker::Address.city}, #{Faker::Address.state} #{Faker::Address.zip}"
  c = Customer.create!(name: Faker::Name.name, address: address)
  100.times do
    item = items.sample
    c.items.create!(name: item[:name],
                    price_in_cents: item[:price_in_cents],
                    category: item[:category]
                   )
  end
end
