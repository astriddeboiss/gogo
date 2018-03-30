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
w_image_url="http://laliste.net/wp-content/uploads/2016/05/18-bars-et-restaurants-insolites-26.jpg"
w_icon_url="http://res.cloudinary.com/dp9rm52pu/image/upload/v1522408325/noun_1496811_cc.png"
w.remote_photo_url=w_image_url
w.remote_icon_url=w_icon_url
w.save

puts "Cool Bars done"

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

# seed_array = [
#   {
#     name: "Museums & Galleries",
#     url: "https://www.tripadvisor.fr/Attractions-g187147-Activities-c49-t1,28-zfn7236763,29460,7236764-Paris_Ile_de_France.html",
#     duration: [90, 180]
#   },
#   {
#     name: "Parks & Gardens",
#     url: 'https://www.tripadvisor.fr/Attractions-g187147-Activities-c61-Paris_Ile_de_France.html',
#     duration: [30, 60]
#   },

#   {
#   name: "Panoramic Views",
#   url: 'https://www.tripadvisor.fr/Attractions-g187147-Activities-c47-t13,120,166,39,2-Paris_Ile_de_France.html',
#    duration: [30, 90]
#   },

#   {
#     name: "Monuments & Must-See",
#     url: 'https://www.tripadvisor.fr/Attractions-g187147-Activities-c47-Paris_Ile_de_France.html',
#     duration: [30, 180]
#   },

#   {
#     name: "Historical Neighbourhoods",
#     url: 'https://www.tripadvisor.fr/Attractions-g187147-Activities-c47-t34-Paris_Ile_de_France.html',
#     duration: [30, 120]
#   },

#   {
#     name: "Markets",
#     url: 'https://www.tripadvisor.fr/Attractions-g187147-Activities-c26-t142-Paris_Ile_de_France.html',
#     duration: [60, 90]
#   },

#   {
#     name: "Shows & Concerts",
#     url: 'https://www.tripadvisor.fr/Attractions-g187147-Activities-c58-Paris_Ile_de_France.html',
#     duration: [60, 120]
#   },

#   {
#     name: "Shopping Areas",
#     url: 'https://www.tripadvisor.fr/Attractions-g187147-Activities-c26-t138-Paris_Ile_de_France.html',
#     duration: [30, 180]
#   },
# ]

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
puts "#{b.name}"

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
puts "#{c.name}"

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
puts "#{c.name}"

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
puts "#{d.name}"

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
puts "#{e.name}"

f=Activity.new(name:"Musée du quai Branly", description:"Le musée du quai Branly – Jacques-Chirac ou musée des arts et civilisations d'Afrique, d'Asie, d'Océanie et des Amériques (civilisations non européennes) est situé au quai Branly dans le 7e arrondissement de Paris, le long du quai de la Seine qui lui a donné son nom et au pied de la tour Eiffel. Le projet, porté par Jacques Chirac et réalisé par Jean Nouvel, a été inauguré le 20 juin 2006. La fréquentation se situe à près de 1 500 000 visiteurs en 2014 et a franchi en 2013 le cap des 10 millions depuis son ouverture, ce qui le place parmi les plus fréquentés au monde dans sa catégorie.")
f_image_url="http://br.france.fr/sites/default/files/quai_branly_c_flickr_-_cc_timothy_brown_.jpg"
f.remote_photo_url=f_image_url
f.duration=160
f.category_id=Category.find_by(name:"Contemporary Architecture").id
f.city_id=City.find_by(name:"Paris").id
f.address="37 quai Branly, Paris, 75007"
f.save
puts "#{f.name}"

g=Activity.new(name:"City Information Centre", description:"Situated opposite the South Transept of St Paul’s Cathedral, the City of London Information Centre introduces a dynamic contemporary structure to an area of exceptional architectural and urban heritage. In form, the building combines simplicity and efficiency of structure with a distinctive visual impact. The triangular plan has evolved from analysis of principal pedestrian flows across the site, while the orientation and profile establish an intriguing dialogue with St Paul’s as the building looks up to its prestigious neighbour and opens out to welcome people approaching it. A folded metallic envelope evokes the aerodynamic profile of a paper aeroplane, seamlessly wrapping 140m2 of internal accommodation and formed by a steel frame braced with structural ply and clad in 220 pre-finished stainless steel panels.")
g_image_url="https://images.adsttc.com/media/images/5017/4abd/28ba/0d77/a800/0763/slideshow/stringio.jpg?1427332729"
g.remote_photo_url=g_image_url
g.duration=30
g.category_id=Category.find_by(name:"Contemporary Architecture").id
g.city_id=City.find_by(name:"London").id
g.address="St. Paul's Churchyard, London EC4M 8BX, UK"
g.save
puts "#{g.name}"

h=Activity.new(name:"Tate Modern", description:"Tate Modern is a modern art gallery located in London. It is Britain's national gallery of international modern art and forms part of the Tate group (together with Tate Britain, Tate Liverpool, Tate St Ives and Tate Online).[2] It is based in the former Bankside Power Station, in the Bankside area of the London Borough of Southwark. Tate holds the national collection of British art from 1900 to the present day and international modern and contemporary art.[3] Tate Modern is one of the largest museums of modern and contemporary art in the world. As with the UK's other national galleries and museums, there is no admission charge for access to the collection displays, which take up the majority of the gallery space, while tickets must be purchased for the major temporary exhibitions.")
h_image_url="https://static.independent.co.uk/s3fs-public/styles/article_small/public/thumbnails/image/2016/06/11/16/web-tate-extension-2.jpg"
h.remote_photo_url=h_image_url
h.duration=180
h.category_id=Category.find_by(name:"Contemporary Architecture").id
h.city_id=City.find_by(name:"London").id
h.address="Bankside, London SE1 9TG, UK"
h.save
puts "#{h.name}"

i=Activity.new(name:"Lloyd's building", description:"The Lloyd's building (sometimes known as the Inside-Out Building)[2] is the home of the insurance institution Lloyd's of London. It is located on the former site of East India House in Lime Street, in London's main financial district, the City of London. The building is a leading example of radical Bowellism architecture in which the services for the building, such as ducts and lifts, are located on the exterior to maximise space in the interior. Twenty-five years after completion in 1986, the building received Grade I listing in 2011; it was the youngest structure ever to obtain this status. It is said by Historic England to be universally recognised as one of the key buildings of the modern epoch.")
i_image_url="https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/Lloyds_building_taken_2011.jpg/250px-Lloyds_building_taken_2011.jpg"
i.remote_photo_url=i_image_url
i.duration=60
i.category_id=Category.find_by(name:"Contemporary Architecture").id
i.city_id=City.find_by(name:"London").id
i.address="1 Lime Street, London, UK"
i.save
puts "#{i.name}"

j=Activity.new(name:"The Shard", description:"The Shard, also referred to as the Shard of Glass, Shard London Bridge] and formerly London Bridge Tower, is a 95-storey skyscraper, designed by the Italian architect Renzo Piano, in Southwark, London, that forms part of the Shard Quarter development. Standing 309.7 metres (1,016 ft) high, the Shard is the tallest building in the United Kingdom, the tallest building in the European Union, the fourth-tallest building in Europe and the 96th-tallest building in the world. It is also the second-tallest free-standing structure in the United Kingdom, after the concrete tower of the Emley Moor transmitting station. It replaced Southwark Towers, a 24-storey office block built on the site in 1975.
The Shard's construction began in March 2009; it was topped out on 30 March 2012 and inaugurated on 5 July 2012. Practical completion was achieved in November 2012. The tower's privately operated observation deck, The View from The Shard, was opened to the public on 1 February 2013. The glass-clad pyramidal tower has 72 habitable floors, with a viewing gallery and open-air observation deck on the 72nd floor, at a height of 244 metres (801 ft). The Shard was developed by Sellar Property Group on behalf of LBQ Ltd and is jointly owned by Sellar Property (5%) and the State of Qatar (95%).The Shard is managed by Real Estate Management (UK) Limited on behalf of the owners.")
j_image_url="https://www.thesun.co.uk/wp-content/uploads/2017/12/nintchdbpict000301546667.jpg?strip=all&w=661"
j.remote_photo_url=j_image_url
j.duration=45
j.category_id=Category.find_by(name:"Contemporary Architecture").id
j.city_id=City.find_by(name:"London").id
j.address="32 London Bridge St, London"
j.save

k=Activity.new(name:"Greenwich Park", description:"Greenwich Park is a former hunting park in Greenwich and one of the largest single green spaces in south-east London. One of the Royal Parks of London, and the first to be enclosed (in 1433), it covers 74 hectares (180 acres),[1] and is part of the Greenwich World Heritage Site. It commands fine views over the River Thames, the Isle of Dogs and the City of London (Simon Jenkins rated the view of the Royal Hospital with Canary Wharf in the distance as one of the top ten in England). The park is open year-round. It is listed Grade I on the Register of Historic Parks and Gardens.")
k_image_url="https://www.rmg.co.uk/sites/default/files/styles/slider/public/_38A4548b_Greenwichslider2.jpg?itok=LiIhFXi3"
k.remote_photo_url=k_image_url
k.duration=60
k.category_id=Category.find_by(name:"Parks & Gardens").id
k.city_id=City.find_by(name:"London").id
k.address="London SE10 8XJ, UK"
k.save

l=Activity.new(name:"Richmond Park", description:"Richmond Park, in the London Borough of Richmond upon Thames, was created by Charles I in the 17th century[2] as a deer park. The largest of London's Royal Parks, it is of national and international importance for wildlife conservation. The park is a national nature reserve, a Site of Special Scientific Interest and a Special Area of Conservation and is included, at Grade I, on Historic England's Register of Historic Parks and Gardens of special historic interest in England. Its landscapes have inspired many famous artists and it has been a location for several films and TV series.")
l_image_url="https://us.123rf.com/450wm/anizza/anizza1211/anizza121100131/16418074-paesaggio-invernale-di-richmond-park-%C3%A8-il-pi%C3%B9-grande-parco-dei-parchi-reali-di-londra-e-quasi-tre-volte-pi.jpg?ver=6"
l.remote_photo_url=l_image_url
l.duration=100
l.category_id=Category.find_by(name:"Parks & Gardens").id
l.city_id=City.find_by(name:"London").id
l.address="Descanso House, 199 Kew Road, Richmond TW9 3BW, United Kingdom"
l.save

m=Activity.new(name:"Kew Gardens", description:"Kew Gardens is a botanical garden in southwest London that houses the largest and most diverse botanical and mycological collections in the world. Founded in 1840, from the exotic garden at Kew Park in Middlesex, England, its living collections include more than 30,000 different kinds of plants, while the herbarium, which is one of the largest in the world, has over seven million preserved plant specimens. The library contains more than 750,000 volumes, and the illustrations collection contains more than 175,000 prints and drawings of plants. It is one of London's top tourist attractions and is a World Heritage Site. Kew Gardens, together with the botanic gardens at Wakehurst Place in Sussex, are managed by the Royal Botanic Gardens, Kew (brand name Kew), an internationally important botanical research and education institution that employs 750 staff and is a non-departmental public body sponsored by the Department for Environment, Food and Rural Affairs.")
m_image_url="https://www.virginexperiencedays.co.uk/content/img/product/large/PKEWG2__01.jpg"
m.remote_photo_url=m_image_url
m.duration=60
m.category_id=Category.find_by(name:"Parks & Gardens").id
m.city_id=City.find_by(name:"London").id
m.address="142 Priory Ln, London SW15 5JP, UK"
m.save

n=Activity.new(name:"Hampstead Heath", description:"Hampstead Heath (locally known simply as the Heath) is a large, ancient London park, covering 320 hectares (790 acres). This grassy public space sits astride a sandy ridge, one of the highest points in London, running from Hampstead to Highgate, which rests on a band of London Clay. The heath is rambling and hilly, embracing ponds, recent and ancient woodlands, a lido, playgrounds, and a training track, and it adjoins the former stately home of Kenwood House and its estate. The south-east part of the heath is Parliament Hill, from which the view over London is protected by law. Running along its eastern perimeter are a chain of ponds – including three open-air public swimming pools – which were originally reservoirs for drinking water from the River Fleet. The heath is a Site of Metropolitan Importance for Nature Conservation, and part of Kenwood is a Site of Special Scientific Interest. Lakeside concerts are held there in summer. The heath is managed by the City of London Corporation, and lies mostly within the London Borough of Camden with the adjoining Hampstead Heath Extension and Golders Hill Park in the London Borough of Barnet.")
n_image_url="https://media-cdn.tripadvisor.com/media/photo-s/11/a9/7c/ec/hampstead-heath.jpg"
n.remote_photo_url=n_image_url
n.duration=120
n.category_id=Category.find_by(name:"Parks & Gardens").id
n.city_id=City.find_by(name:"London").id
n.address="49 S End Rd, Hampstead, London"
n.save

puts "vuitton ok"

# each_pair { |name, val|  }

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





