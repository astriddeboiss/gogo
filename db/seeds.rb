puts 'Cleaning database...'
Category.destroy_all

puts 'Creating categories...'
categories_attributes = [
  {
    name: "Museums & Galleries"
    description:
  },
  {
    name: "Parks & Gardens"
    description:
  },
  {
    name: "Panoramic Views"
    description:
  },
  {
    name: "Monuments & Must-See"
    description:
  },
  {
    name: "Authentic Neighbourhoods"
    description:
  },
  {
    name: "Markets"
    description:
  },
  {
    name: "Shows & Concerts"
    description:
  },
  {
    name: "Shopping Areas"
    description:
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
    user: User.create(email: "astrid@gmail.com")
    cartegory: Category.first
  }
]
UserPreference.create!(user_preferences_attributes)
puts 'Finished!'


puts 'Cleaning database...'
Trips.destroy_all

puts 'Creating Trips...'
trips_attributes = [
  {
    city: City.first
    user: User.first
  }
]
Trips.create!(trips_attributes)
puts 'Finished!'



puts 'Cleaning database...'
Activity.destroy_all

puts 'Creating activities...'
activities_attributes = [
  {
    name:
    description:
    photo:
    latitude:
    longitude:
    address:
    opening_at:
    closing_at:
    duration:
    mark_as_done:
    category_id:
    city_id:


  },
  {

  }
]
Activity.create!(activities_attributes)
puts 'Finished!'
