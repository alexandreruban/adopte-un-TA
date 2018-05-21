puts "Destroying previous data..."
User.destroy_all
Course.destroy_all

puts "Creating 15 new users..."
15.times do
  User.create({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 'foobar',
    passord_confirmation: 'foobar'
  })
end

puts "Creating new courses..."
puts "3 users will have between 3 and 7 courses..."
users_with_courses = User.take(3)
users_with_courses.each do |user|
  (3..7).to_a.sample.times do
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
