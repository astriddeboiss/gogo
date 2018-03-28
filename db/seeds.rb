require 'open-uri'

puts 'Cleaning TripActivity...'
TripActivity.destroy_all

puts 'Cleaning Activity...'
Activity.destroy_all

puts 'Cleaning UserPreference...'
UserPreference.destroy_all

puts 'Cleaning Category...'
Category.destroy_all

puts 'Cleaning Trip...'
Trip.destroy_all

puts 'Cleaning City...'
City.destroy_all



puts 'Creating categories...'
categories_attributes = [
  {
    name: "Museums & Galleries",
    description: "A museum is an institution that cares for (conserves) a collection of artifacts and other objects of artistic, cultural, historical, or scientific importance.",
    remote_photo_url: 'https://images.unsplash.com/reserve/NnDHkyxLTFe7d5UZv9Bk_louvre.jpg?ixlib=rb-0.3.5&s=d9ddaf9f8a5dc16ba6da0d8d14d835a3&auto=format&fit=crop&w=2240&q=80',
    remote_icon_url: 'http://res.cloudinary.com/dp9rm52pu/image/upload/v1522141193/museum_noun.png'
  },
  {
    name: "Parks & Gardens",
    description: "A park is an area of natural, semi-natural or planted space set aside for human enjoyment and recreation or for the protection of wildlife or natural habitats.",
    remote_photo_url: 'https://www.royalparks.org.uk/parks/hyde-park/things-to-see-and-do/memorials,-fountains-and-statues/diana-memorial-fountain/_gallery/Diana-Memorial-Fountain-from-across-the-Serpentine.jpg/w_1200.jpg',
    remote_icon_url: 'https://res.cloudinary.com/dp9rm52pu/image/upload/v1522141243/park_noun.png'
  },
  {
    name: "Panoramic Views",
    description: "A panorama is any wide-angle view or representation of a physical space.",
    remote_photo_url: 'https://images.fineartamerica.com/images-medium-large/basilica-di-san-pietro-deborah-lynn-guber.jpg',
    remote_icon_url: 'https://res.cloudinary.com/dp9rm52pu/image/upload/v1522141407/view_noun.png'
  },
  {
    name: "Monuments & Must-See",
    description: "A panorama is any wide-angle view or representation of a physical space.",
    remote_photo_url: 'https://images.unsplash.com/photo-1496546591938-b3e0375d6d1b?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8f4d13e919e06a756b110b4c796b2d2e&auto=format&fit=crop&w=1516&q=80',
    remote_icon_url: 'https://res.cloudinary.com/dp9rm52pu/image/upload/v1522141100/landmark_noun.png'
  },
  {
    name: "Historical Neighbourhoods",
    description: "A neighbourhood, or neighborhood, is a geographically localised community within a larger city, town, suburb or rural area.",
    remote_photo_url: 'https://www.dentons.com/-/media/images/website/background-images/offices/rome/rome_1900x1500.jpg',
    remote_icon_url: 'https://res.cloudinary.com/dp9rm52pu/image/upload/v1522141012/neighborhood_noun.png'
  },
  {
    name: "Markets",
    description: "A market, or marketplace, is a location where people regularly gather for the purchase and sale of provisions, livestock, and other goods.",
    remote_photo_url: 'https://images.unsplash.com/photo-1513125370-3460ebe3401b?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=feb294cd683500b96d58ce3a48fe9406&auto=format&fit=crop&w=1334&q=80',
    remote_icon_url: 'https://res.cloudinary.com/dp9rm52pu/image/upload/v1522141079/market_noun.png'
  },
  {
    name: "Shows & Concerts",
    description: "A concert is a live music performance in front of an audience. The performance may be by a single musician, sometimes then called a recital, or by a musical ensemble, such as an orchestra, choir, or band.",
    remote_photo_url: 'https://images.unsplash.com/photo-1483393458019-411bc6bd104e?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=2d5b88caa61ddd0fc8bf669a0e3ee875&auto=format&fit=crop&w=700&q=60',
    remote_icon_url: 'https://res.cloudinary.com/dp9rm52pu/image/upload/v1522141039/concert_noun.png'
  },
  {
    name: "Shopping Areas",
    description: "Shopping is an activity in which a customer browses the available goods or services presented by one or more retailers with the intent to purchase a suitable selection of them.",
    remote_photo_url: 'https://images.unsplash.com/photo-1520006403909-838d6b92c22e?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=cd5c81517b22ee13e47484cddb56d16c&auto=format&fit=crop&w=1500&q=80',
    remote_icon_url: 'https://res.cloudinary.com/dp9rm52pu/image/upload/v1522140981/shopping_noun.png'
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

seed_array = [
  {
    name: "Museums & Galleries",
    url: "https://www.tripadvisor.fr/Attractions-g187147-Activities-c49-t1,28-zfn7236763,29460,7236764-Paris_Ile_de_France.html",
    duration: [90, 180]
  },
  {
    name: "Parks & Gardens",
    url: 'https://www.tripadvisor.fr/Attractions-g187147-Activities-c61-Paris_Ile_de_France.html',
    duration: [30, 60]
  },

  {
  name: "Panoramic Views",
  url: 'https://www.tripadvisor.fr/Attractions-g187147-Activities-c47-t13,120,166,39,2-Paris_Ile_de_France.html',
   duration: [30, 90]
  },

  {
    name: "Monuments & Must-See",
    url: 'https://www.tripadvisor.fr/Attractions-g187147-Activities-c47-Paris_Ile_de_France.html',
    duration: [30, 180]
  },

  {
    name: "Historical Neighbourhoods",
    url: 'https://www.tripadvisor.fr/Attractions-g187147-Activities-c47-t34-Paris_Ile_de_France.html',
    duration: [30, 120]
  },

  {
    name: "Markets",
    url: 'https://www.tripadvisor.fr/Attractions-g187147-Activities-c26-t142-Paris_Ile_de_France.html',
    duration: [60, 90]
  },

  {
    name: "Shows & Concerts",
    url: 'https://www.tripadvisor.fr/Attractions-g187147-Activities-c58-Paris_Ile_de_France.html',
    duration: [60, 120]
  },

  {
    name: "Shopping Areas",
    url: 'https://www.tripadvisor.fr/Attractions-g187147-Activities-c26-t138-Paris_Ile_de_France.html',
    duration: [30, 180]
  },
]

seed_array.each do |seed_array_item|
  puts "Creating activity for #{seed_array_item[:name]}..."
  url = open(seed_array_item[:url])
  category = Category.find_by_name(seed_array_item[:name])
  activities_serialized = open(url).read
  activities = Nokogiri::HTML(activities_serialized)
  activities.search(".listing_title a").each do |activity|


   unless activity.attributes["href"].value.nil?

      activity_url = activity.attributes["href"].value
      activity_serialized = open("https://www.tripadvisor.fr" + activity_url).read
      activity_doc = Nokogiri::HTML(activity_serialized)


      name = activity_doc.search("#HEADING").empty? ? "default" : activity_doc.search("#HEADING").text
      # description = activity_doc.search("#SECTION_OVERVIEW").empty? ? "Great Place to visit" : activity_doc.search("#SECTION_OVERVIEW").text

      description = activity_doc.search(".partial_entry").empty? ? "Great Place to visit" : activity_doc.search(".partial_entry").text
      # duration = activity_doc.search("#DETAILS").empty? ? "60" : activity_doc.search(".detail_section duration").text.split[3]

      duration = ((rand(seed_array_item[:duration][0]..seed_array_item[:duration][1])) / 10) * 10
      # photo = activity_doc.search("#BIG_PHOTO_CAROUSEL img").empty? ? "https://www.prestotours.com/wp-content/uploads/2015/10/rome-colosseum.jpg" : activity_doc.search("#BIG_PHOTO_CAROUSEL img").first.attributes["src"].value
      begin
        photo = activity_doc.search(".carousel_images img").nil? ? "https://www.prestotours.com/wp-content/uploads/2015/10/rome-colosseum.jpg" : activity_doc.search(".carousel_images img").last.attributes["src"].value
      rescue => e
        puts e
        photo = "https://www.prestotours.com/wp-content/uploads/2015/10/rome-colosseum.jpg"
      end
      address = activity_doc.search(".street-address").empty? ? "Champ de Mars, 5 Avenue Anatole France, 75007 Paris" : activity_doc.search('.street-address').first.text + " " + activity_doc.search('.locality').first.text
      opens_at = activity_doc.search('.time').empty? ? DateTime.new(2018,1,1,9) : activity_doc.search('.time').first.text.to_time
      closes_at = activity_doc.search('.time').empty? ? DateTime.new(2018,1,1,18) : activity_doc.search('.time').last.text.to_time
      city = City.find_by_name("Paris")
      new_activity = Activity.new(name: name, description: description, duration: duration, address: address, closes_at: closes_at, opens_at: opens_at, category: category, city: city)
      new_activity.remote_photo_url = photo
      new_activity.save
      puts "#{new_activity.name} created!"
    end
  end
end
puts 'Finished Scrap activities'


# puts 'Creating Users...'
# users_attributes = [
#   {
#     first_name: "Brigitte",
#     last_name: "Macron",
#     email: "brigitte@gmail.com",
#     password: "secret"
#   },
#   {
#     first_name: "Zinedine",
#     last_name: "Zidane",
#     email: "zidane@gmail.com",
#     password: "secret"
#   },
#   {
#     first_name: "Elon",
#     last_name: "Musk",
#     email: "elon@gmail.com",
#     password: "secret"
#   }
# ]
# User.create!(users_attributes)
# puts 'Finished!'


# puts 'Creating Users...'
# users_attributes = [
#   {
#     first_name: "Victor",
#     last_name: "Sardet",
#     email: "victor2@gmail.com",
#     password: "secret"
#   },
#   {
#     first_name: "Simone",
#     last_name: "Basse",
#     email: "simone2@gmail.com",
#     password: "secret"
#   },
#   {
#     first_name: "Pierre",
#     last_name: "Collier",
#     email: "pierre1@gmail.com",
#     password: "secret"
#   }
# ]
# User.create!(users_attributes)
# puts 'Finished!'

# puts 'Creating User Preferences...'
# user_preferences_attributes = [
#   {
#     user: User.new(email: "marc1@gmail.com", password: "secret"),
#     category: Category.first
#   }
# ]
# UserPreference.create!(user_preferences_attributes)
# puts 'Finished!'



# puts 'Creating Trips...'
# trips_attributes = [
#   {
#     name: "#{User.first.first_name}'s trip in #{City.first.name}",
#     city: City.first,
#     user: User.first
#   }
# ]
# Trip.create!(trips_attributes)
# puts 'Finished!'





