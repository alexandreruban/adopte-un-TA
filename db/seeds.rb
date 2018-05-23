puts "Destroying previous data..."
Booking.destroy_all
User.destroy_all
Course.destroy_all

p 'Creating 12 users'

users_attributes = [
  {
    first_name:'Kevin',
    last_name:'Robert',
    email:'kevin.j.robert@gmail.com',
    avatar:'image/upload/v1527072488/9978111.jpg',
    password: 'foobar'
  },
  {
    first_name:'Julien',
    last_name:'Da Silva',
    email:'julien.da.silva@hotmail.com',
    avatar:'image/upload/v1527072497/11377783.jpg',
    password: 'foobar'
  },
  {
    first_name:'Xavier',
    last_name:'Arques',
    email:'xavierarques@yahoo.com',
    avatar:'image/upload/v1527072511/pbqsfxjaoclnqia1xfhz.jpg',
    password: 'foobar'
  },
    {
    first_name:'Capucine',
    last_name:'Scheidel-Buchet',
    email:'capucine.scheidelbuchet@gmail.com',
    avatar:'image/upload/v1527072523/31478848.jpg',
    password: 'foobar'
  },
    {
    first_name:'Sébastien',
    last_name:'Saunier',
    email:'seb@saunier.me',
    avatar:'image/upload/v1527072474/414418.jpg',
    password: 'foobar'
  },
    {
    first_name:'Oscar',
    last_name:'Friedel',
    email:'ofriedel@gmail.com',
    avatar:'image/upload/v1527072452/ezdn5qfm3tzmchsjpn49.jpg',
    password: 'foobar'
  },
    {
    first_name:'Tanguy',
    last_name:'Foujols',
    email:'tanguy.foujols@icloud.com',
    avatar:'image/upload/v1527072465/rrl0etzxghraeswlqd4d.jpg',
    password: 'foobar'
  },
  {
    first_name:'Basile',
    last_name:'Marquefave',
    email:'basile.marquefave@gmail.com',
    avatar:'image/upload/v1527072435/ffvqsq2rvcxw5zwolcc3.jpg',
    password: 'foobar'
  },
  {
    first_name:'Floriane',
    last_name:'Perrin De Brichambaut',
    email:'floperrindb@gmail.com',
    avatar:'image/upload/v1527073059/35752299.jpg',
    password: 'foobar'
  },
  {
    first_name:'Guillaume',
    last_name:'la Roquette',
    email:'guillaume.dutti@live.fr',
    avatar:'image/upload/v1527073105/wq5uwxdpmrwvo0vbr0bp.jpg',
    password: 'foobar'
  },
    {
    first_name:'Guillaume',
    last_name:'Legrand',
    email:'gjlegrandfr@gmail.com',
    avatar:'image/upload/v1527073140/29280478.jpg',
    password: 'foobar'
  },
    {
    first_name:'Marjorie',
    last_name:'Boyer',
    email:'marjorie.boyer3@gmail.com',
    avatar:'image/upload/v1527073345/35493058.jpg',
    password: 'foobar'
  },
    {
    first_name:'Alexandre',
    last_name:'Ruban',
    email:'alexandre.ruban@gmail.com',
    avatar:'image/upload/v1527073383/33979976.jpg',
    password: 'foobar'
  },
]

User.create!(users_attributes)
p 'Users: done'



# puts "Creating 15 new users..."
# 15.times do
#   user = User.new({
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     email: Faker::Internet.email,
#     password: 'foobar',
#     password_confirmation: 'foobar'
#   })
#   user.remote_avatar_url = 'https://source.unsplash.com/collection/1383703'
#   user.save
# end

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
      end_date: Date.today
    })
  end
end

puts "Seeding finished!! :)"
