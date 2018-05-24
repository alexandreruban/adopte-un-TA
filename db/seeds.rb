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
    password: 'foobar'
  },
  {
    first_name:'Julien',
    last_name:'Da Silva',
    email:'julien.da.silva@hotmail.com',
    password: 'foobar'
  },
  {
    first_name:'Xavier',
    last_name:'Arques',
    email:'xavierarques@yahoo.com',
    password: 'foobar'
  },
    {
    first_name:'Capucine',
    last_name:'Scheidel-Buchet',
    email:'capucine.scheidelbuchet@gmail.com',
    password: 'foobar'
  },
    {
    first_name:'Sébastien',
    last_name:'Saunier',
    email:'seb@saunier.me',
    password: 'foobar'
  },
    {
    first_name:'Oscar',
    last_name:'Friedel',
    email:'ofriedel@gmail.com',
    password: 'foobar'
  },
    {
    first_name:'Tanguy',
    last_name:'Foujols',
    email:'tanguy.foujols@icloud.com',
    password: 'foobar'
  },
  {
    first_name:'Basile',
    last_name:'Marquefave',
    email:'basile.marquefave@gmail.com',
    password: 'foobar'
  },
  {
    first_name:'Floriane',
    last_name:'Perrin',
    email:'floperrindb@gmail.com',
    password: 'foobar'
  },
  {
    first_name:'Guillaume',
    last_name:'la Roquette',
    email:'guillaume.dutti@live.fr',
    password: 'foobar'
  },
    {
    first_name:'Guillaume',
    last_name:'Legrand',
    email:'gjlegrandfr@gmail.com',
    password: 'foobar'
  },
    {
    first_name:'Marjorie',
    last_name:'Boyer',
    email:'marjorie.boyer3@gmail.com',
    password: 'foobar'
  },
    {
    first_name:'Alexandre',
    last_name:'Ruban',
    email:'alexandre.ruban@gmail.com',
    password: 'foobar'
  },
]

# User.create!(users_attributes)
# p 'Users: done'
urls = ['http://res.cloudinary.com/de7jtv0ha/image/upload/v1527072488/9978111.jpg',
        'http://res.cloudinary.com/de7jtv0ha/image/upload/v1527072497/11377783.jpg',
        'http://res.cloudinary.com/de7jtv0ha/image/upload/v1527072511/pbqsfxjaoclnqia1xfhz.jpg',
        'http://res.cloudinary.com/de7jtv0ha/image/upload/v1527072523/31478848.jpg',
        'http://res.cloudinary.com/de7jtv0ha/image/upload/v1527072474/414418.jpg',
        'http://res.cloudinary.com/de7jtv0ha/image/upload/v1527072452/ezdn5qfm3tzmchsjpn49.jpg',
        'http://res.cloudinary.com/de7jtv0ha/image/upload/v1527072465/rrl0etzxghraeswlqd4d.jpg',
        'http://res.cloudinary.com/de7jtv0ha/image/upload/v1527072435/ffvqsq2rvcxw5zwolcc3.jpg',
        'http://res.cloudinary.com/de7jtv0ha/image/upload/v1527073059/35752299.jpg',
        'http://res.cloudinary.com/de7jtv0ha/image/upload/v1527073105/wq5uwxdpmrwvo0vbr0bp.jpg',
        'http://res.cloudinary.com/de7jtv0ha/image/upload/v1527073140/29280478.jpg',
        'http://res.cloudinary.com/de7jtv0ha/image/upload/v1527073345/35493058.jpg',
        'http://res.cloudinary.com/de7jtv0ha/image/upload/v1527073383/33979976.jpg',
        ]

users = []
users_attributes.each_with_index do |user, index|
  user = User.new(user)
  user.remote_avatar_url = urls[index]
  user.save!
  users << user;
end

file = "db/samples.yml"
samples = YAML.load(open(file).read)

puts "Creating #{samples["courses"].count} courses..."
samples["courses"].each_with_index do |course|
  teacher = users.sample      # A random teacher
  teacher.courses.create!(course.slice("title", "description", "address", "begin_date", "end_date", "price"))
end

puts "Seeding finished!! :)"
