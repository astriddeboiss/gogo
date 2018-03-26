require 'open-uri'

puts 'Cleaning database...'
TripActivity.destroy_all

puts 'Cleaning database...'
Activity.destroy_all

puts 'Cleaning database...'
UserPreference.destroy_all

puts 'Cleaning database...'
Category.destroy_all

puts 'Cleaning database...'
Trip.destroy_all

puts 'Cleaning database...'
City.destroy_all



puts 'Creating categories...'
categories_attributes = [
  {
    name: "Museums & Galleries",
    description: "A museum is an institution that cares for (conserves) a collection of artifacts and other objects of artistic, cultural, historical, or scientific importance.",
    remote_photo_url: 'https://images.unsplash.com/reserve/NnDHkyxLTFe7d5UZv9Bk_louvre.jpg?ixlib=rb-0.3.5&s=d9ddaf9f8a5dc16ba6da0d8d14d835a3&auto=format&fit=crop&w=2240&q=80'
  },
  {
    name: "Parks & Gardens",
    description: "A park is an area of natural, semi-natural or planted space set aside for human enjoyment and recreation or for the protection of wildlife or natural habitats.",
    remote_photo_url: 'https://www.royalparks.org.uk/parks/hyde-park/things-to-see-and-do/memorials,-fountains-and-statues/diana-memorial-fountain/_gallery/Diana-Memorial-Fountain-from-across-the-Serpentine.jpg/w_1200.jpg'
  },
  {
    name: "Panoramic Views",
    description: "A panorama is any wide-angle view or representation of a physical space.",
    remote_photo_url: 'https://images.fineartamerica.com/images-medium-large/basilica-di-san-pietro-deborah-lynn-guber.jpg'
  },
  {
    name: "Monuments & Must-See",
    description: "A panorama is any wide-angle view or representation of a physical space.",
    remote_photo_url: 'https://images.unsplash.com/photo-1496546591938-b3e0375d6d1b?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8f4d13e919e06a756b110b4c796b2d2e&auto=format&fit=crop&w=1516&q=80'
  },
  {
    name: "Historical Neighbourhoods",
    description: "A neighbourhood, or neighborhood, is a geographically localised community within a larger city, town, suburb or rural area.",
    remote_photo_url: 'https://www.dentons.com/-/media/images/website/background-images/offices/rome/rome_1900x1500.jpg'
  },
  {
    name: "Markets",
    description: "A market, or marketplace, is a location where people regularly gather for the purchase and sale of provisions, livestock, and other goods.",
    remote_photo_url: 'https://images.unsplash.com/photo-1513125370-3460ebe3401b?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=feb294cd683500b96d58ce3a48fe9406&auto=format&fit=crop&w=1334&q=80'
  },
  {
    name: "Shows & Concerts",
    description: "A concert is a live music performance in front of an audience. The performance may be by a single musician, sometimes then called a recital, or by a musical ensemble, such as an orchestra, choir, or band.",
    remote_photo_url: 'https://images.unsplash.com/photo-1483393458019-411bc6bd104e?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=2d5b88caa61ddd0fc8bf669a0e3ee875&auto=format&fit=crop&w=700&q=60'
  },
  {
    name: "Shopping Areas",
    description: "Shopping is an activity in which a customer browses the available goods or services presented by one or more retailers with the intent to purchase a suitable selection of them.",
    remote_photo_url: 'https://images.unsplash.com/photo-1520006403909-838d6b92c22e?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=cd5c81517b22ee13e47484cddb56d16c&auto=format&fit=crop&w=1500&q=80'
  },
]
Category.create!(categories_attributes)
puts 'Finished!'


puts 'Creating cities...'
cities_attributes = [
  {
    name: "Rome",
    remote_photo_url: 'https://www.dentons.com/-/media/images/website/background-images/offices/rome/rome_1900x1500.jpg'
  },
  {
    name: "Paris",
    remote_photo_url: 'https://www.telegraph.co.uk/content/dam/video_previews/v/2/v2exl2nje6lsczqgxklf2mh1qjkhmfu-xlarge.jpg'
  },
  {
    name: "Barcelona",
    remote_photo_url: 'https://www.goldcar.es/assets/img/oficinas/background/BCN.jpg'
  },
  {
    name: "London",
    remote_photo_url: 'https://travel.home.sndimg.com/content/dam/images/travel/fullset/2015/05/28/big-ben-london-england.jpg.rend.hgtvcom.1280.960.suffix/1491582155388.jpg'
  },
  {
    name: "Amsterdam",
    remote_photo_url: 'http://www.armaghantravel.com/wp-content/uploads/2018/03/680137FB-0B39-584A-4AEF675BE3B3A60F.jpg'
  }
]
City.create!(cities_attributes)
puts 'Finished!'

puts 'Creating activities...'

show_activities_url = "https://www.tripadvisor.fr/Attraction_Products-g187147-zfg11872-Paris_Ile_de_France.html"
show_activities_serialized = open(show_activities_url).read

activities = Nokogiri::HTML(show_activities_serialized)
activities.search(".listing_title a").each do |activity|
  puts "----------------------"
  puts activity.attributes
  puts "----------------------"
  unless activity.attributes["onclick"].value.match(/(\/AttractionProductDetail\-.+\.html)/).nil?
    activity_url = activity.attributes["onclick"].value.match(/(\/AttractionProductDetail\-.+\.html)/)[1]
    activity_serialized = open("https://www.tripadvisor.fr" + activity_url).read
    activity_doc = Nokogiri::HTML(activity_serialized)

    name = activity_doc.search("#HEADING").empty? ? "default" : activity_doc.search("#HEADING").text
    description = activity_doc.search("#SECTION_OVERVIEW").empty? ? "Great Place to visit" : activity_doc.search("#SECTION_OVERVIEW").text
    duration = activity_doc.search("#DETAILS").empty? ? "varies" : activity_doc.search("#DETAILS").text.split[3]
    binding.pry
    # photo = activity_doc.search("#BIG_PHOTO_CAROUSEL img").empty ? "https://www.prestotours.com/wp-content/uploads/2015/10/rome-colosseum.jpg" : activity_doc.search("#BIG_PHOTO_CAROUSEL img").first.attributes["src"].value
    photo = "http://www.lonelyplanet.com/travel-blog/tip-article/wordpress_uploads/2014/11/RS-shutterstock_236049502-f4d6a4a0cfd4.jpg"
    address = "Champ de Mars, 5 Avenue Anatole France, 75007 Paris"
    opens_at = DateTime.new(2018,1,1,9)
    closes_at =  DateTime.new(2018,1,1,18)
    category =  Category.limit(4)[3]
    city = City.find_by_name("Paris")
    Activity.create(name: name, description: description, photo: photo, duration: duration, address: address, closes_at: closes_at, opens_at: opens_at, category: category, city: city)
  end
end
puts 'Finished Scrap activities'


puts 'Creating Users...'
users_attributes = [
  {
    first_name: "Brigitte",
    last_name: "Macron",
    email: "brigitte@gmail.com",
    password: "secret"
  },
  {
    first_name: "Zinedine",
    last_name: "Zidane",
    email: "zidane@gmail.com",
    password: "secret"
  },
  {
    first_name: "Elon",
    last_name: "Musk",
    email: "elon@gmail.com",
    password: "secret"
  }
]
User.create!(users_attributes)
puts 'Finished!'


puts 'Creating Users...'
users_attributes = [
  {
    first_name: "Victor",
    last_name: "Sardet",
    email: "victor@gmail.com",
    password: "secret"
  },
  {
    first_name: "Simone",
    last_name: "Basse",
    email: "simone@gmail.com",
    password: "secret"
  },
  {
    first_name: "Pierre",
    last_name: "Collier",
    email: "pierre@gmail.com",
    password: "secret"
  }
]
User.create!(users_attributes)
puts 'Finished!'

puts 'Creating User Preferences...'
user_preferences_attributes = [
  {
    user: User.new(email: "marie@gmail.com", password: "secret"),
    category: Category.first
  }
]
UserPreference.create!(user_preferences_attributes)
puts 'Finished!'



puts 'Creating Trips...'
trips_attributes = [
  {
    name: "#{User.first.first_name}'s trip in #{City.first.name}",
    city: City.first,
    user: User.first
  }
]
Trip.create!(trips_attributes)
puts 'Finished!'





