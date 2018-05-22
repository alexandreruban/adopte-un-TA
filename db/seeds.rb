puts "Destroying previous data..."
Booking.destroy_all
User.destroy_all
Course.destroy_all

puts "Creating 15 new users..."
15.times do
  user = User.new({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 'foobar',
    password_confirmation: 'foobar'
  })
  user.remote_avatar_url = 'https://source.unsplash.com/collection/1383703'
  user.save
end

puts "Creating new courses..."
puts "5 users will have between 1 and 3 courses..."
users_with_courses = User.take(5)
users_with_courses.each do |user|
  (1..3).to_a.sample.times do
    user.courses.create({
      title: Faker::ProgrammingLanguage.name,
      description: Faker::Lorem.paragraph,
      address: Faker::Address.street_address,
      price: 30,
      begin_date: Date.today,
      end_date: Faker::Date.forward(30)
    })
  end
end

puts "Seeding finished!! :)"
