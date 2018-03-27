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
activities_attributes = [
  {
    name: "Colosseum",
    description: "The Colosseum or Coliseum, also known as the Flavian Amphitheatre, is an oval amphitheatre in the centre of the city of Rome, Italy. Built of travertine, tuff, and brick-faced concrete, it is the largest amphitheatre ever built.",
    remote_photo_url: "https://www.prestotours.com/wp-content/uploads/2015/10/rome-colosseum.jpg",
    address: "Piazza del Colosseo, 1, 00184 Roma RM, Italy",
    opens_at: DateTime.new(2018,1,1,9),
    closes_at: DateTime.new(2018,1,1,18),
    duration: 60,
    category: Category.limit(4)[3],
    city: City.first
  },
  {
    name: "Pantheon",
    description: "The Pantheon is a former Roman temple, now a church, in Rome, Italy, on the site of an earlier temple commissioned by Marcus Agrippa during the reign of Augustus (27 BC – 14 AD).",
    remote_photo_url: "http://www.polomusealelazio.beniculturali.it/getImage.php?id=543&w=800&h=600&f=0&.jpg",
    address: "Piazza della Rotonda, 00186 Roma RM, Italy",
    opens_at: DateTime.new(2018,1,1,9),
    closes_at: DateTime.new(2018,1,1,18),
    duration: 45,
    category: Category.limit(4)[3],
    city: City.first
  },
  {
    name: "Spanish Steps",
    description: "The Spanish Steps are a set of steps in Rome, Italy, climbing a steep slope between the Piazza di Spagna at the base and Piazza Trinità dei Monti, dominated by the Trinità dei Monti church at the top.",
    remote_photo_url: "http://romeonsegway.com/wp-content/plugins/widgetkit/cache/gallery/759/spanish3-935e4d033a.jpg",
    address: "Piazza di Spagna, 00187 Roma RM, Italy",
    opens_at: DateTime.new(2018,1,1,9),
    closes_at: DateTime.new(2018,1,1,18),
    duration: 30,
    category: Category.limit(4)[3],
    city: City.first
  },
  {
    name: "Vatican Museums",
    description: "The Vatican Museums are Christian and art museums located within the city boundaries of the Vatican City.",
    remote_photo_url: "https://fthmb.tqn.com/Co3D8RIK9e-jO4xs1DfdL4h0lW0=/960x0/filters:no_upscale()/GettyImages-125834407-5930dffc3df78c08ab574afa.jpg",
    address: "Viale Vaticano, 00165 Roma RM, Italy",
    opens_at: DateTime.new(2018,1,1,9),
    closes_at: DateTime.new(2018,1,1,16),
    duration: 120,
    category: Category.first,
    city: City.first
  },
  {
    name: "Galleria Borghese",
    description: "The Galleria Borghese is an art gallery in Rome, Italy, housed in the former Villa Borghese Pinciana.",
    remote_photo_url: "https://media-cdn.tripadvisor.com/media/photo-s/0e/91/aa/77/achterzijde-van-galleria.jpg",
    address: "Piazzale Scipione Borghese, 5, 00197 Roma RM, Italy",
    opens_at: DateTime.new(2018,1,1,9),
    closes_at: DateTime.new(2018,1,1,18),
    duration: 60,
    category: Category.first,
    city: City.first
  },
  {
    name: "Eiffel Tower",
    description: "The Eiffel Tower is a wrought iron lattice tower on the Champ de Mars in Paris, France. It is named after the engineer Gustave Eiffel, whose company designed and built the tower.",
    remote_photo_url: "http://img.jakpost.net/c/2017/02/10/2017_02_10_21340_1486708892._large.jpg",
    address: "Champ de Mars, 5 Avenue Anatole France, 75007 Paris",
    opens_at: DateTime.new(2018,1,1,9.5),
    closes_at: DateTime.new(2018,1,1,23),
    duration: 120,
    category: Category.limit(4)[3],
    city: City.limit(2)[1]
  },
  {
    name: "The Louvre",
    description: "The Louvre Palace is a former royal palace located on the Right Bank of the Seine in Paris, between the Tuileries Gardens and the church of Saint-Germain l'Auxerrois.",
    remote_photo_url: "https://cdn.getyourguide.com/img/tour_img-659439-148.jpg",
    address: "Rue de Rivoli, 75001 Paris",
    opens_at: DateTime.new(2018,1,1,9),
    closes_at: DateTime.new(2018,1,1,18),
    duration: 60,
    category: Category.limit(4)[3],
    city: City.limit(2)[1]
  },
  {
    name: "Sacré-Cœur",
    description: "The Basilica of the Sacred Heart of Paris, commonly known as Sacré-Cœur Basilica and often simply Sacré-Cœur, is a Roman Catholic church and minor basilica, dedicated to the Sacred Heart of Jesus, in Paris, France.",
    remote_photo_url: "https://en.parisinfo.com/var/otcp/sites/images/media/1.-photos/02.-sites-culturels-630-x-405/sacre-coeur-630x405-c-thinkstock3/37144-1-fre-FR/Sacre-Coeur-630x405-C-Thinkstock.jpg",
    address: "35 Rue du Chevalier de la Barre, 75018 Paris",
    opens_at: DateTime.new(2018,1,1,9),
    closes_at: DateTime.new(2018,1,1,18),
    duration: 60,
    category: Category.limit(4)[3],
    city: City.limit(2)[1]
  },
  {
    name: "Le Marais",
    description: "Le Marais is a historic district in Paris, France. Long the aristocratic district of Paris, it hosts many outstanding buildings of historic and architectural importance. It spreads across parts of the 3rd and 4th arrondissements in Paris.",
    remote_photo_url: "http://www.lonelyplanet.com/travel-blog/tip-article/wordpress_uploads/2014/11/RS-shutterstock_236049502-f4d6a4a0cfd4.jpg",
    address: "Le Marais, Paris",
    opens_at: DateTime.new(2018,1,1,0),
    closes_at: DateTime.new(2018,1,1,24),
    duration: 60,
    category: Category.limit(4)[3],
    city: City.limit(5)[4]
  },
  {
    name: "Montmartre",
    description: "Montmartre is a large hill in Paris's 18th arrondissement. It is 130 m high and gives its name to the surrounding district, part of the Right Bank in the northern section of the city.",
    remote_photo_url: "https://res.cloudinary.com/sagacity/image/upload/c_crop,h_657,w_1000,x_0,y_0/c_limit,f_auto,fl_lossy,q_80,w_1080/shutterstock_215389222_o7ys8m.jpg",
    address: "Montmartre, Paris",
    opens_at: DateTime.new(2018,1,1,0),
    closes_at: DateTime.new(2018,1,1,24),
    duration: 60,
    category: Category.limit(4)[3],
    city: City.limit(5)[4]
  }
]
Activity.create!(activities_attributes)
puts 'Finished!'

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



