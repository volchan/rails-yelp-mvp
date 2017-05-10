
puts 'Destroying db :O !!!!!!'
Restaurant.destroy_all
puts 'Restaurants table anihilated !!'
Review.destroy_all
puts 'Reviews table anihilated !!'

puts 'SEEDING.....'
categories = %w(italian belgian japanese spannish chinese french english)

50.times do
  category = categories.sample
  Restaurant.create!(name: Faker::RickAndMorty.character, address: Faker::Address.street_address, phone_number: Faker::PhoneNumber.cell_phone, category: category)
  puts 'seeding a restaurant'
end

Restaurant.all.each do |restaurant|
  rand(5..10).times do
    restaurant.reviews.create!(content: Faker::Lorem.paragraph, rating: rand(0..5))
    puts "seeding a review for #{restaurant.name}"
  end
end

puts 'done !'
