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

a=Category.new(name:"Contemporary Architecture", description:"Contemporary architecture is the architecture of the 21st century. No single style is dominant.")
a_image_url="https://archinect.imgix.net/uploads/iu/iuzqr872mhkafzpg.jpg?auto=compress%2Cformat"
a_icon_url="http://res.cloudinary.com/dp9rm52pu/image/upload/v1522364683/noun_1312391_cc.png"
a.remote_photo_url=a_image_url
a.remote_icon_url=a_icon_url
a.save
puts "Contemporary Architecture done"

w=Category.new(name:"Cool Bars", description:"Cool bars are places where you would bring a friend for a drink.")
w_image_url= "http://laliste.net/wp-content/uploads/2016/05/18-bars-et-restaurants-insolites-26.jpg"
w_icon_url="http://res.cloudinary.com/dp9rm52pu/image/upload/v1522408325/noun_1496811_cc.png"
w.remote_photo_url=w_image_url
w.remote_icon_url=w_icon_url
w.save

puts "Cool bars done"

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
    remote_icon_url: 'http://res.cloudinary.com/dp9rm52pu/image/upload/v1522365036/noun_88063_cc.png'
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
    name: "Barcelona",
    remote_photo_url: 'https://www.goldcar.es/assets/img/oficinas/background/BCN.jpg'
  },
  {
    name: "London",
    remote_photo_url: 'https://travel.home.sndimg.com/content/dam/images/travel/fullset/2015/05/28/big-ben-london-england.jpg.rend.hgtvcom.1280.960.suffix/1491582155388.jpg'
  },
  {
    name: "Paris",
    remote_photo_url: 'https://www.telegraph.co.uk/content/dam/video_previews/v/2/v2exl2nje6lsczqgxklf2mh1qjkhmfu-xlarge.jpg'
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

b=Activity.new(name:"Fondation Vuitton", description:"La Fondation d'entreprise Louis Vuitton, anciennement Fondation d'entreprise Louis Vuitton pour la création1, lancée en octobre 2006, a été créée par le groupe LVMH et ses maisons. Elle a pour objectif de promouvoir l’art et la culture et de pérenniser les actions de mécénat engagées depuis 1990 par le groupe.
Le bâtiment, conçu par l'architecte Frank Gehry, est situé au Jardin d'acclimatation, dans le bois de Boulogne à Paris. Ce projet qui se veut une réplique à la fondation Pinault installée à Venise, est l'expression médiatique de la concurrence entre Bernard Arnault, le patron du numéro un mondial du luxe, et son rival François Pinault.")
b_image_url="https://uploads.lebonbon.fr/source/2015/10/image-fondation-louis-vuitton-54476e642e0a2_950x380.jpg"
b.remote_photo_url=b_image_url
b.latitude=48.52
b.longitude=15.48
b.duration=120
b.category_id=Category.find_by(name:"Contemporary Architecture").id
b.city_id=City.find_by(name:"Paris").id
b.address="8 Avenue du Mahatma Gandhi, 75116 Paris"
b.save

c=Activity.new(name:"Philharmonie de Paris", description:"La Philharmonie de Paris est un établissement culturel principalement consacré à la musique symphonique, bénéficiant d'un équipement acoustique de haute qualité, mais aussi à la musique de chambre, au jazz ou aux musiques du monde. Ses formations résidentes sont l'Orchestre de Paris et l'Ensemble intercontemporain. Le dessin du projet reprend les formes d’une colline en aluminium couverte de pavés superposés horizontalement coupés d’un aileron vertical pour jouer sur les lignes de perspectives existantes. Il s’érige comme une butte offrant un panorama sur Paris et ses alentours, au-delà du périphérique")
c_image_url="http://www.cultival.pro/wp-content/uploads/cache/2016/05/nos-partenaires-et-references_philharmonie-800x518/598428472.jpg"
c.remote_photo_url=c_image_url
c.latitude=48.53
c.longitude=2.23
c.duration=90
c.category_id=Category.find_by(name:"Contemporary Architecture").id
c.city_id=City.find_by(name:"Paris").id
c.address="221 Avenue Jean Jaurès, 75019 Paris"
c.save

c=Activity.new(name:"Palais de Justice", description:"C’est par sa transparence, sa clarté, sa précision que ce bâtiment peut aspirer à une valeur symbolique. Une forme pérenne, presque mathématique, radicale, sans arrogance et sans pesanteur. Si notre bâtiment permettait au citoyen d’appréhender la justice avec une certaine sérénité, ce sera parce que ce bâtiment est clair, léger, transparent, lumineux et ouvert sur la ville.")
c_image_url="https://i0.wp.com/www.parisvox.info/wp-content/uploads/2018/01/nouveau-palais-de-justice-porte-de-clichy-2.jpg?fit=1100%2C1100&ssl=1"
c.remote_photo_url=c_image_url
c.latitude=48.89
c.longitude=2.31
c.duration=30
c.category_id=Category.find_by(name:"Contemporary Architecture").id
c.city_id=City.find_by(name:"Paris").id
c.address="6-10 Avenue de la Porte de Clichy
75017 Paris"
c.save

d=Activity.new(name:"La Seine Musicale", description:"La Seine Musicale est un ensemble de bâtiments en forme de vaisseau, consacrés à toute la musique, ouverts à tous les publics et pouvant accueillir des manifestations variées : artistiques, politiques, festives, commerciales etc. Elle est située sur la pointe aval de l'Île Seguin à Boulogne-Billancourt dans les Hauts-de-Seine.")
d_image_url="https://www.3is.fr/paris/wp-content/uploads/2017/05/seine-musicale.jpg"
d.remote_photo_url=d_image_url
d.latitude=48.49
d.longitude=2.14
d.duration=45
d.category_id=Category.find_by(name:"Contemporary Architecture").id
d.city_id=City.find_by(name:"Paris").id
d.address="La Seine Musicale, Île Seguin, 92100 Boulogne-Billancourt"
d.save

e=Activity.new(name:"Centre Pompidou", description:"Le Centre national d’art et de culture Georges-Pompidou (CNAC) – communément appelé « Centre Georges-Pompidou », « Centre Pompidou » ou « Centre Beaubourg », et familièrement « Beaubourg » – est un établissement polyculturel né de la volonté du président Georges Pompidou, grand amateur d'art moderne, de créer au cœur de Paris une institution culturelle originale entièrement vouée à la création moderne et contemporaine où les arts plastiques voisineraient avec les livres, le design, la musique et le cinéma.")
e_image_url="https://i.pinimg.com/originals/30/68/71/306871d5003efdb93da70bceacc20b90.jpg"
e.remote_photo_url=e_image_url
e.latitude=48.51
e.longitude=2.21
e.duration=120
e.category_id=Category.find_by(name:"Contemporary Architecture").id
e.city_id=City.find_by(name:"Paris").id
e.address="Place Georges-Pompidou, 75004 Paris"
e.save

f=Activity.new(name:"Musée du quai Branly", description:"Le musée du quai Branly – Jacques-Chirac ou musée des arts et civilisations d'Afrique, d'Asie, d'Océanie et des Amériques (civilisations non européennes) est situé au quai Branly dans le 7e arrondissement de Paris, le long du quai de la Seine qui lui a donné son nom et au pied de la tour Eiffel. Le projet, porté par Jacques Chirac et réalisé par Jean Nouvel, a été inauguré le 20 juin 2006. La fréquentation se situe à près de 1 500 000 visiteurs en 2014 et a franchi en 2013 le cap des 10 millions depuis son ouverture, ce qui le place parmi les plus fréquentés au monde dans sa catégorie.")
f_image_url="http://br.france.fr/sites/default/files/quai_branly_c_flickr_-_cc_timothy_brown_.jpg"
f.remote_photo_url=f_image_url
f.latitude=48.51
f.longitude=2.17
f.duration=160
f.category_id=Category.find_by(name:"Contemporary Architecture").id
f.city_id=City.find_by(name:"Paris").id
f.address="37 quai Branly, Paris, 75007"
f.save
puts "vuittton ok"

puebla=Activity.new(name:"Pavillion Puebla", description:"Le Pavillion Puebla – Dans le Parc des Buttes Chaumont, au niveau de l’Avenue Darcel, une grande maison recouverte de lierre à laquelle on accède par une volée d’escaliers de pierre, vous êtes au  Pavillon Puebla. Au cœur de cet écrin de végétation, vous trouverez un restaurant, deux terrasses, deux bars, des constructions de bois, des fauteuils marocains, une balançoire… et la paix. Entre les voûtes Napoléoniennes et les toiles épaisses tendues sur les murs, on y sert des pizzas et des plats raffinés sur les tables.")
puebla_image_url="https://u.tfstatic.com/restaurant_photos/081/67081/169/612/le-pavillon-puebla-l-arrivee-3769f.jpg"
puebla.remote_photo_url=puebla_image_url
puebla.duration=240
puebla.category_id=Category.find_by(name:"Cool Bars").id
puebla.city_id=City.find_by(name:"Paris").id
puebla.address="Parc des Buttes Chaumont, Avenue Darcel, 75019 Paris"
puebla.save

puts 'Puebla done'

perchoir=Activity.new(name:"Le Perchoir", description:"Le Perchoir – Au 6ème et 7ème étage d’un immeuble industriel, vous trouverez un toit-terrasse, un grand bar, un restaurant, des cours de sport, une cabane à snack, .  Vous verrez des oiseaux, le Sacré-Cœur, des cheminées, des plants de tomates, des vignes, une pergola, des coussins moelleux.")
perchoir_image_url="https://1.bp.blogspot.com/-pk3uEcxfqlI/V6wX7BPVL9I/AAAAAAAAQzU/4ArKvHT2Gzkh9I_GlzhNpC86im1__qiEQCLcB/s400/Le%2Bperchoir%252C%2Bce%2Bn%25E2%2580%2599est%2Bpas%2Bque%2Bpour%2Bles%2Boiseaux%2B%2521%2B%25281%2529.jpg"
perchoir.remote_photo_url=perchoir_image_url
perchoir.duration=240
perchoir.category_id=Category.find_by(name:"Cool Bars").id
perchoir.city_id=City.find_by(name:"Paris").id
perchoir.address="14 Rue Crespin du Gast, 75011 Paris"
perchoir.save

puts 'Perchoir done'

cafea=Activity.new(name:"Le Café A", description:"Le Café A – Le Café A est situé dans l’ancien couvent des Récollets à Paris dans le 10ème arrondissement, à proximité de la gare de l’Est. Il offre un cadre privilégié dans un écrin de verdure, en plein cœur de Paris et dans un lieu historique. Il se compose d’un cloître, d’un jardin et de différents espaces intérieurs dont une ancienne chapelle. Il abrite également le Centre des Récollets, des résidences d’artistes et de chercheurs, la Maison de l’Architecture et l’Ordre des Architectes en Île de France.")
cafea_image_url="http://blog.privateaser.com/wp-content/uploads/2016/07/jardin-privé.jpg"
cafea.remote_photo_url=cafea_image_url
cafea.duration=240
cafea.category_id=Category.find_by(name:"Cool Bars").id
cafea.city_id=City.find_by(name:"Paris").id
cafea.address="148 Rue du Faubourg Saint-Martin, 75010 Paris"
cafea.save

puts 'Cafe A done'

mercerie=Activity.new(name:"La Mercerie", description:"La Mercerie – La Mercerie est situé dans la trépidante rue Oberkampf, la Mercerie, bar iconique du quartier, rassemble dès l'apéro, les gourmands autour de planches savoureuses et de pizzas faites maison, dans une ambiance joyeuse et effervescente, et ce jusqu'au bout de la nuit. ")
mercerie_image_url="http://blog.toryburch.com/wp-content/uploads/2018/02/FWFall2018_La-Mercerie_960_slide1.jpg"
mercerie.remote_photo_url=cafea_image_url
mercerie.duration=240
mercerie.category_id=Category.find_by(name:"Cool Bars").id
mercerie.city_id=City.find_by(name:"Paris").id
mercerie.address="98 Rue Oberkampf, 75011 Paris"
mercerie.save

puts 'Mercerie done'

# seed_array.each do |seed_array_item|
#   puts "Creating activity for #{seed_array_item[:name]}..."
#   url = open(seed_array_item[:url])
#   category = Category.find_by_name(seed_array_item[:name])
#   activities_serialized = open(url).read
#   activities = Nokogiri::HTML(activities_serialized)
#   activities.search(".listing_title a").each do |activity|


#    unless activity.attributes["href"].value.nil?

#       activity_url = activity.attributes["href"].value
#       activity_serialized = open("https://www.tripadvisor.fr" + activity_url).read
#       activity_doc = Nokogiri::HTML(activity_serialized)


#       name = activity_doc.search("#HEADING").empty? ? "default" : activity_doc.search("#HEADING").text
#       # description = activity_doc.search("#SECTION_OVERVIEW").empty? ? "Great Place to visit" : activity_doc.search("#SECTION_OVERVIEW").text

#       description = activity_doc.search(".partial_entry").empty? ? "Great Place to visit" : activity_doc.search(".partial_entry").text
#       # duration = activity_doc.search("#DETAILS").empty? ? "60" : activity_doc.search(".detail_section duration").text.split[3]

#       duration = ((rand(seed_array_item[:duration][0]..seed_array_item[:duration][1])) / 10) * 10
#       # photo = activity_doc.search("#BIG_PHOTO_CAROUSEL img").empty? ? "https://www.prestotours.com/wp-content/uploads/2015/10/rome-colosseum.jpg" : activity_doc.search("#BIG_PHOTO_CAROUSEL img").first.attributes["src"].value
#       begin
#         photo = activity_doc.search(".carousel_images img").nil? ? "https://www.prestotours.com/wp-content/uploads/2015/10/rome-colosseum.jpg" : activity_doc.search(".carousel_images img").last.attributes["src"].value
#       rescue => e
#         puts e
#         photo = "https://www.prestotours.com/wp-content/uploads/2015/10/rome-colosseum.jpg"
#       end
#       address = activity_doc.search(".street-address").empty? ? "Champ de Mars, 5 Avenue Anatole France, 75007 Paris" : activity_doc.search('.street-address').first.text + " " + activity_doc.search('.locality').first.text
#       opens_at = activity_doc.search('.time').empty? ? DateTime.new(2018,1,1,9) : activity_doc.search('.time').first.text.to_time
#       closes_at = activity_doc.search('.time').empty? ? DateTime.new(2018,1,1,18) : activity_doc.search('.time').last.text.to_time
#       city = City.find_by_name("Paris")
#       new_activity = Activity.new(name: name, description: description, duration: duration, address: address, closes_at: closes_at, opens_at: opens_at, category: category, city: city)
#       new_activity.remote_photo_url = photo
#       new_activity.save
#       puts "#{new_activity.name} created!"
#     end
#   end
# end
# puts 'Finished Scrap activities'



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





