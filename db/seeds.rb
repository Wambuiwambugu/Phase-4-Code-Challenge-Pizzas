require 'faker'
puts "Deleteing old data..."
RestaurantPizza.destroy_all
Pizza.destroy_all
Restaurant.destroy_all

puts "Creating pizzas..."
10.times do 
    pizza = Pizza.create(
        name: Faker::Space.star,
        ingredients: Faker::Food.ingredient
    ) 
end

puts "Creating Restaurants..."
4.times do
    restaurant = Restaurant.create(
        name: Faker::Restaurant.name,
        address: Faker::Address.street_address
    )
end

put "Creatinn restaurant pizzas..."
15.times do
    pizza = Pizza.order('RANDOM()').first
    restaurant = Restaurant.order('RANDOM()').first

    restaurant_pizza = RestaurantPizza.create(
        price: rand(1..30),
        pizza_id: pizza.id,
        restaurant_id: restaurant.id
    )
end
puts "✅ Done seeding!"