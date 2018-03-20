puts 'Cleaning database...'
Category.destroy_all

puts 'Creating categories...'
categories_attributes = [
  {
    name: "Museums & Galleries"
    description: "A museum is an institution that cares for (conserves) a collection of artifacts and other objects of artistic, cultural, historical, or scientific importance."
  },
  {
    name: "Parks & Gardens"
    description: "A park is an area of natural, semi-natural or planted space set aside for human enjoyment and recreation or for the protection of wildlife or natural habitats."
  },
  {
    name: "Panoramic Views"
    description: "A panorama is any wide-angle view or representation of a physical space."
  },
  {
    name: "Monuments & Must-See"
    description: "A panorama is any wide-angle view or representation of a physical space."
  },
  {
    name: "Historical Neighbourhoods"
    description: "A neighbourhood, or neighborhood, is a geographically localised community within a larger city, town, suburb or rural area."
  },
  {
    name: "Markets"
    description: "A market, or marketplace, is a location where people regularly gather for the purchase and sale of provisions, livestock, and other goods."
  },
  {
    name: "Shows & Concerts"
    description: "A concert is a live music performance in front of an audience. The performance may be by a single musician, sometimes then called a recital, or by a musical ensemble, such as an orchestra, choir, or band."
  },
  {
    name: "Shopping Areas"
    description: "Shopping is an activity in which a customer browses the available goods or services presented by one or more retailers with the intent to purchase a suitable selection of them."
  },
]
Category.create!(categories_attributes)
puts 'Finished!'


puts 'Cleaning database...'
City.destroy_all

puts 'Creating cities...'
cities_attributes = [
  {
    name: "Rome"
    remote_photo_url: 'https://unsplash.com/photos/JazIGJ8_iw4'
  },
  {
    name: "Paris"
    remote_photo_url: 'https://unsplash.com/photos/5XndD3FhH-w'
  },
  {
    name: "Barcelona"
    remote_photo_url: 'https://unsplash.com/photos/uu2EA5gCALc'
  },
  {
    name: "London"
    remote_photo_url: 'https://unsplash.com/photos/Oja2ty_9ZLM'
  },
  {
    name: "Amsterdam"
    remote_photo_url: 'https://unsplash.com/photos/BAgwNyjPFUc'
  }
]
Cities.create!(cities_attributes)
puts 'Finished!'


puts 'Cleaning database...'
UserPreference.destroy_all

puts 'Creating User Preferences...'
user_preferences_attributes = [
  {
    user: User.first
    category: Category.first
  }
]
UserPreference.create!(user_preferences_attributes)
puts 'Finished!'


puts 'Cleaning database...'
Trips.destroy_all

puts 'Creating Trips...'
trips_attributes = [
  {
    city_id: City.first
    user_d: User.first
  }
]
Trips.create!(trips_attributes)
puts 'Finished!'



puts 'Cleaning database...'
Activity.destroy_all

puts 'Creating activities...'
activities_attributes = [
  {
    name: "Colosseum"
    description: "The Colosseum or Coliseum, also known as the Flavian Amphitheatre, is an oval amphitheatre in the centre of the city of Rome, Italy. Built of travertine, tuff, and brick-faced concrete, it is the largest amphitheatre ever built."
    remote_photo_url: "https://www.prestotours.com/wp-content/uploads/2015/10/rome-colosseum.jpg"
    address: "Piazza del Colosseo, 1, 00184 Roma RM, Italy"
    opening_at: DateTime.new(2018,1,1,9)
    closing_at: DateTime.new(2018,1,1,18)
    duration: 60
    mark_as_done: false
    category_id: Category.limit(4).[3]
    city_id: City.first
  },
  {
    name: "Pantheon"
    description: "The Pantheon is a former Roman temple, now a church, in Rome, Italy, on the site of an earlier temple commissioned by Marcus Agrippa during the reign of Augustus (27 BC – 14 AD)."
    remote_photo_url: "http://www.polomusealelazio.beniculturali.it/getImage.php?id=543&w=800&h=600&f=0&.jpg"
    address: "Piazza della Rotonda, 00186 Roma RM, Italy"
    opening_at: DateTime.new(2018,1,1,9)
    closing_at: DateTime.new(2018,1,1,18)
    duration: 45
    mark_as_done: false
    category_id: Category.limit(4).[3]
    city_id: City.first
  },
  {
    name: ""
    description: ""
    remote_photo_url: ""
    address: ""
    opening_at: DateTime.new(2018,1,1,9)
    closing_at: DateTime.new(2018,1,1,18)
    duration: 30
    mark_as_done: false
    category_id: Category.limit(4).[3]
    city_id: City.first
  },
  {
    name: ""
    description: ""
    remote_photo_url: ""
    address: ""
    opening_at: DateTime.new(2018,1,1,9)
    closing_at: DateTime.new(2018,1,1,18)
    duration: 30
    mark_as_done: false
    category_id: Category.limit(4).[3]
    city_id: City.first
  },
  {
    name: ""
    description: ""
    remote_photo_url: ""
    address: ""
    opening_at: DateTime.new(2018,1,1,9)
    closing_at: DateTime.new(2018,1,1,18)
    duration: 30
    mark_as_done: false
    category_id: Category.limit(4).[3]
    city_id: City.first
  },
]
Activity.create!(activities_attributes)
puts 'Finished!'
