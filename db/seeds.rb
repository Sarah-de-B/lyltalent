# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# --- USERS ---
Message.destroy_all
Chat.destroy_all
EntertainmentApplication.destroy_all
Entertainment.destroy_all
Event.destroy_all
User.destroy_all
artist_persona = User.new(
  email: "sarah@example.com",
  password: "password",
  last_name: "Dupont",
  first_name: "Sarah",
  artist_name: "Aurora",
  phone_number: "0611223344",
  role: "artiste",
  address: "Paris",
  instruments: ["Chant, Piano, Percussions"],
  musical_styles: ["Pop", "Soul", "Rock"],
  covers: true,
  original_composition: false,
  stage_time_in_minutes: 75,
  tools: "Microphone, ampli, cables jack",
  tools_needed: "Piano électrique ou acoustique",
  concert_number: 15,
  bio: "Chanteuse passionnée, je vous guiderai jusqu'à l'océan, mer de tranquilité. Douceur avec fracas. Calme contre tempête.",
  artist_type: "soliste",
  vehicule: false,
  date_of_birth: Date.new(1995, 6, 10),
  instagram_url: "https://www.instagram.com/steficelma/?hl=fr",
  legal_entity_type: "auto-entrepreneur",
  siret: "123 456 789 00012",
  description_education: "Diplômée du Conservatoire de Paris en chant moderne.",
  description_experience: "5 ans d'expérience en concerts et événements privés.",
  price: "500-1000 EUR",
  epk_completed: true
)
puts "created en cours"
file = Rails.root.join("db/seeds/users/stefi_celma.jpg").open
artist_persona.photos.attach(io: file, filename: "photo.jpg", content_type: "image/jpeg")
file = Rails.root.join("db/seeds/users/stefi_celma2.jpg").open
artist_persona.photos.attach(io: file, filename: "photo.jpg", content_type: "image/jpeg")
file = Rails.root.join("db/seeds/users/stefi_celma3.jpg").open
artist_persona.photos.attach(io: file, filename: "photo.jpg", content_type: "image/jpeg")
puts "done"
artist_persona.save!
# p artist_persona.valid?
# p artist_persona.errors.messages
# p artist_persona.id
file = Rails.root.join("db/seeds/users/videos/sarah_show.mp4").open
artist_persona.videos.attach(io: file, filename: "sarah_show.mp4", content_type: "video/mp4")

file = Rails.root.join("db/seeds/users/videos/sarah_to_delete.mp4").open
artist_persona.videos.attach(io: file, filename: "sarah_to_delete.mp4", content_type: "video/mp4")
# :guitare: artistes
puts "event_planner"

artiste1 = User.new(
  email: "jules.d@example.com",
  password: "password123",
  last_name: "Durand",
  first_name: "Julien",
  artist_name: "Jules D.",
  phone_number: "0612345678",
  role: "artiste",
  address: "Nantes",
  instruments: ["Guitare", "Chant"],
  musical_styles: ["Pop", "Folk"],
  covers: true,
  original_composition: true,
  stage_time_in_minutes: 90,
  tools: "Ampli Fender",
  tools_needed: "Batterie électronique, scène, ingé son",
  concert_number: 25,
  bio: "Auteur-compositeur passionné par les sonorités acoustiques modernes.",
  artist_type: "soliste",
  vehicule: true,
  date_of_birth: Date.new(1993, 4, 15),
  epk_completed: true
)
file = Rails.root.join("db/seeds/users/julien.jpg").open
artiste1.photos.attach(io: file, filename: "photo.jpg", content_type: "image/jpeg")

artiste1.save!
puts "artiste1 valid? #{artiste1.valid?}"

artiste2 = User.new(
  email: "sofi.beats@example.com",
  password: "password123",
  last_name: "Nguyen",
  first_name: "Sophie",
  artist_name: "Sofi Beats",
  phone_number: "0678123456",
  role: "artiste",
  address: "Paris",
  instruments: ["Clavier", "MAO"],
  musical_styles: ["Electro", "House"],
  covers: false,
  original_composition: true,
  stage_time_in_minutes: 120,
  tools: "Ableton Live",
  tools_needed: "Technicien son",
  concert_number: 40,
  bio: "DJ/productrice inspirée par la scène électro européenne.",
  artist_type: "DJ",
  vehicule: false,
  date_of_birth: Date.new(1990, 9, 3),
  epk_completed: true
)
file = Rails.root.join("db/seeds/users/sophie.jpg").open
artiste2.photos.attach(io: file, filename: "photo.jpg", content_type: "image/jpeg")

artiste2.save!
puts "artiste2 valid? #{artiste2.valid?}"

artiste3 = User.new(
  email: "krimflow@example.com",
  password: "password123",
  last_name: "Benali",
  first_name: "Karim",
  artist_name: "K-Rim Flow",
  phone_number: "0654781234",
  role: "artiste",
  address: "Lyon",
  instruments: ["Rap", "Beatbox"],
  musical_styles: ["Hip-hop", "Rap"],
  covers: false,
  original_composition: true,
  stage_time_in_minutes: 60,
  tools: "Micro, sampler",
  tools_needed: "DJ pour scratch",
  concert_number: 15,
  bio: "groupe engagé qui mêle textes conscients et punchlines puissantes.",
  artist_type: "groupe",
  vehicule: true,
  date_of_birth: Date.new(1998, 12, 21),
  epk_completed: false
)
file = Rails.root.join("db/seeds/users/karim.jpg").open
artiste3.photos.attach(io: file, filename: "photo.jpg", content_type: "image/jpeg")

artiste3.save!
puts "artiste3 valid? #{artiste3.valid?}"

# :micro: Event Planners
event_planner1 = User.create!(
  email: "sarah.event@example.com",
  password: "password",
  last_name: "Martin",
  first_name: "Anetta",
  phone_number: "0645781234",
  role: "organisateur d'événements",
  address: "Nantes",
  bio: "Organisatrice d'événements culturels et musicaux depuis 8 ans."
)
file = Rails.root.join("db/seeds/users/anetta.png").open
event_planner1.photos.attach(io: file, filename: "photo.jpg", content_type: "image/jpeg")

event_planner2 = User.create!(
  email: "thomas.prod@example.com",
  password: "password123",
  last_name: "Leclerc",
  first_name: "Thomas",
  phone_number: "0623456789",
  role: "organisateur d'événements",
  address: "Nantes",
  bio: "Spécialisé dans la gestion de festivals et de concerts."
)
file = Rails.root.join("db/seeds/users/thomas.jpg").open
event_planner2.photos.attach(io: file, filename: "photo.jpg", content_type: "image/jpeg")

event_planner3 = User.create!(
  email: "amelie.agency@example.com",
  password: "password123",
  last_name: "Dupuis",
  first_name: "Amélie",
  phone_number: "0698765432",
  role: "organisateur d'événements",
  address: "Nantes",
  bio: "Directrice d'agence événementielle, experte en booking d’artistes."
)
file = Rails.root.join("db/seeds/users/amelie.jpg").open
event_planner3.photos.attach(io: file, filename: "photo.jpg", content_type: "image/jpeg")

# --- EVENTS (liés aux event planners) ---
demo_event = Event.create!(
  category: ["Dynamique", "Conviviale", "Dansant"],
  duration: 90,
  address: "2 Rue de la Biscuiterie, 44000 Nantes",
  estimated_public_in_number: 100,
  public_age: 20,
  musical_styles: ["Pop", "Electro, Hard Rock"],
  cover_or_composition: "composition",
  number_of_artists_needed: 1,
  name: "Vendredi tout est permis, en musique!",
  description: "Transportez le public au bord de la mer calme",
  vehicule: false,
  date: Date.new(2025, 9, 7),
  user: event_planner1 # tu peux réutiliser un event planner existant
)
file = Rails.root.join("db/seeds/events/Soiree_Demo_Sarah.jpg").open
demo_event.photo.attach(io: file, filename: "photo.jpg", content_type: "image/jpeg")

event0 = Event.create!(
  category: ["Dynamique", "Conviviale", "Dansant"],
  duration: 180,
  address: "4 Boulevard Léon Bureau, 44200 Nantes",
  estimated_public_in_number: 500,
  public_age: 25,
  musical_styles: ["Pop", "Electro"],
  cover_or_composition: "composition",
  number_of_artists_needed: 3,
  name: "Un Festival d'Été inoubliable",
  description: "Un festival dédié aux artistes émergents",
  vehicule: true,
  date: Date.new(2025, 9, 7),
  user: event_planner1
)
file = Rails.root.join("db/seeds/events/Festival_d_ete.jpg").open
event0.photo.attach(io: file, filename: "photo.jpg", content_type: "image/jpeg")

event1 = Event.create!(
  category: ["Dynamique", "Conviviale", "Dansant"],
  duration: 180,
  address: "4 Boulevard de Stalingrad, 44000 Nantes",
  estimated_public_in_number: 500,
  public_age: 25,
  musical_styles: ["Pop", "Electro"],
  cover_or_composition: "composition",
  number_of_artists_needed: 3,
  name: "Un Festival d'Été inoubliable",
  description: "Un festival dédié aux artistes émergents",
  vehicule: true,
  date: Date.new(2025, 9, 6),
  user: event_planner1
)
file = Rails.root.join("db/seeds/events/Festival_d_ete.jpg").open
event1.photo.attach(io: file, filename: "photo.jpg", content_type: "image/jpeg")

event2 = Event.create!(
  category: ["Dynamique", "Conviviale", "Dansant"],
  duration: 240,
  address: "21 Quai des Antilles, 44200 Nantes",
  estimated_public_in_number: 300,
  public_age: 22,
  musical_styles: ["Electro", "House"],
  cover_or_composition: "composition",
  number_of_artists_needed: 1,
  name: "Nuit Électro à Paris",
  description: "Nuit électro avec DJs français et internationaux",
  vehicule: false,
  date: Date.new(2025, 8, 20),
  user: event_planner2
)
file = Rails.root.join("db/seeds/events/soiree_electro.jpeg").open
event2.photo.attach(io: file, filename: "photo.jpg", content_type: "image/jpeg")

event3 = Event.create!(
  category: ["Dynamique", "Conviviale", "Dansant"],
  duration: 120,
  address: "4 Place Marc Elder, 44000 Nantes",
  estimated_public_in_number: 200,
  public_age: 20,
  musical_styles: ["Hip-hop", "Rap"],
  cover_or_composition: "composition",
  number_of_artists_needed: 3,
  name: "Open Mic Hip-Hop – scène libre",
  description: "Scène ouverte pour les rappeurs et beatboxers.",
  vehicule: false,
  date: Date.new(2025, 9, 5),
  user: event_planner3
)
file = Rails.root.join("db/seeds/events/open mic_hip_hop.jpeg").open
event3.photo.attach(io: file, filename: "photo.jpg", content_type: "image/jpeg")

p "Events created: #{Event.count}"
#--- ENTERTAINMENTS (liés aux musiciens + events) ---
# Seed 1
demo_event_1 = Event.create!(
  category: ["Intimiste", "Romantique", "Acoustique"],
  duration: 120,
  address: "Place Graslin, 44000 Nantes",
  estimated_public_in_number: 50,
  public_age: 35,
  musical_styles: ["Jazz", "Soul", "Blues"],
  cover_or_composition: "cover",
  number_of_artists_needed: 2,
  name: "Soirée Jazz au clair de lune",
  description: "Soirée jazz intime dans une ambiance feutrée",
  vehicule: true,
  date: Date.new(2025, 11, 15),
  user: event_planner1
)
file = Rails.root.join("db/seeds/events/graslin.jpg").open
demo_event_1.photo.attach(io: file, filename: "photo.jpg", content_type: "image/jpeg")

demo_entertainment_1 = Entertainment.create!(
  artist_type: "soliste",
  starts_at: DateTime.new(2025, 11, 15, 19, 30),
  ends_at: DateTime.new(2025, 11, 15, 21, 30),
  included_services: ["Hébergement"],
  artist_experience_in_years: "8",
  duration_in_minutes: 120,
  available_tool: "Piano, éclairage tamisé, système son",
  necessary_tool: "Contrebasse",
  planned_remuneration: "Cachet",
  planned_remuneration_in_euros: 800,
  event: demo_event_1,
  user:  nil
)

# Seed 2
demo_event_2 = Event.create!(
  category: ["Festive", "Énergique", "Dansant"],
  duration: 180,
  address: "Quai de la Fosse, 44000 Nantes",
  estimated_public_in_number: 300,
  public_age: 25,
  musical_styles: ["Reggae", "Ska", "Dub"],
  cover_or_composition: "composition",
  number_of_artists_needed: 4,
  name: "Summer Vibes Festival",
  description: "Festival reggae en plein air avec vue sur la Loire",
  vehicule: true,
  date: Date.new(2025, 7, 20),
  user: event_planner1
)
file = Rails.root.join("db/seeds/events/fosse.jpg").open
demo_event_2.photo.attach(io: file, filename: "photo.jpg", content_type: "image/jpeg")

demo_entertainment_2 = Entertainment.create!(
  artist_type: "Groupe",
  starts_at: DateTime.new(2025, 7, 20, 18, 0),
  ends_at: DateTime.new(2025, 7, 20, 21, 0),
  included_services: ["Transport", "Catering"],
  artist_experience_in_years: "12",
  duration_in_minutes: 180,
  available_tool: "Scène principale, éclairage professionnel, sonorisation",
  necessary_tool: "Instruments de percussion additionnels",
  planned_remuneration: "Cachet",
  planned_remuneration_in_euros: 2500,
  event: demo_event_2,
  user: nil

)

# Seed 3
demo_event_3 = Event.create!(
  category: ["Culturel", "Éducatif", "Classique"],
  duration: 75,
  address: "Château des ducs de Bretagne, 44000 Nantes",
  estimated_public_in_number: 80,
  public_age: 45,
  musical_styles: ["Classique", "Baroque", "Musique de chambre"],
  cover_or_composition: "cover",
  number_of_artists_needed: 3,
  name: "Concert baroque au château",
  description: "Musique baroque dans le cadre historique du château",
  vehicule: false,
  date: Date.new(2025, 9, 12),
  user: event_planner1
)
file = Rails.root.join("db/seeds/events/chateaux.jpg").open
demo_event_3.photo.attach(io: file, filename: "photo.jpg", content_type: "image/jpeg")

demo_entertainment_3 = Entertainment.create!(
  artist_type: "Groupe",
  starts_at: DateTime.new(2025, 9, 12, 16, 0),
  ends_at: DateTime.new(2025, 9, 12, 1),
  included_services: ["Programme de concert"],
  artist_experience_in_years: "15",
  duration_in_minutes: 75,
  available_tool: "Acoustique naturelle, sièges",
  necessary_tool: "Violon, violoncelle, clavecin",
  planned_remuneration: "Cachet",
  planned_remuneration_in_euros: 1200,
  event: demo_event_3,
  user: nil
)

# Seed 4
demo_event_4 = Event.create!(
  category: ["Alternative", "Underground", "Expérimental"],
  duration: 150,
  address: "Île de Nantes, Hangar à Bananes, Quai des Antilles, 44200 Nantes",
  estimated_public_in_number: 200,
  public_age: 28,
  musical_styles: ["Techno", "House", "Ambient"],
  cover_or_composition: "composition",
  number_of_artists_needed: 3,
  name: "Nuit Électronique Underground",
  description: "Électronique expérimentale dans un lieu industriel",
  vehicule: true,
  date: Date.new(2025, 12, 31),
  user: event_planner1
)
file = Rails.root.join("db/seeds/events/ware.jpg").open
demo_event_4.photo.attach(io: file, filename: "photo.jpg", content_type: "image/jpeg")

demo_entertainment_4 = Entertainment.create!(
  artist_type: "DJ",
  starts_at: DateTime.new(2025, 12, 31, 22, 0),
  ends_at: DateTime.new(2026, 1, 1, 0, 30),
  included_services: ["Transport", "Hébergement", "Technique"],
  artist_experience_in_years: "6",
  duration_in_minutes: 150,
  available_tool: "Tables de mixage, système son, éclairage LED",
  necessary_tool: "Contrôleurs MIDI, casque professionnel",
  planned_remuneration: "Cachet",
  planned_remuneration_in_euros: 1500,
  event: demo_event_4,
  user: nil,
  instruments: ['Platines', 'Synthétiseur']
)

# Seed 5
demo_event_5 = Event.create!(
  category: ["Familial", "Convivial", "Éducatif"],
  duration: 60,
  address: "Jardin des Plantes, Rue Stanislas Baudry, 44000 Nantes",
  estimated_public_in_number: 150,
  public_age: 8,
  musical_styles: ["Chanson française", "Comptines", "Folk"],
  cover_or_composition: "cover",
  number_of_artists_needed: 1,
  name: "Concert pour enfants au jardin",
  description: "Spectacle musical interactif pour toute la famille",
  vehicule: false,
  date: Date.new(2025, 6, 1),
  user: event_planner1
)
file = Rails.root.join("db/seeds/events/jardin.jpg").open
demo_event_5.photo.attach(io: file, filename: "photo.jpg", content_type: "image/jpeg")

demo_entertainment_5 = Entertainment.create!(
  artist_type: "Soliste",
  starts_at: DateTime.new(2025, 6, 1, 15, 0),
  ends_at: DateTime.new(2025, 6, 1, 16, 0),
  included_services: ["Animation", "Matériel pédagogique"],
  artist_experience_in_years: "10",
  duration_in_minutes: 60,
  available_tool: "Micro sans fil, petite sonorisation",
  necessary_tool: "Guitare acoustique, instruments de percussion pour enfants",
  planned_remuneration: "Cachet",
  planned_remuneration_in_euros: 400,
  event: demo_event_5,
  user: nil,
  instruments: ['Clarinette', 'Voix', 'Percussions']
)
demo_entertainment = Entertainment.create!(
  artist_type: "Soliste",
  starts_at: DateTime.new(2025, 9, 7, 20, 0),
  ends_at: DateTime.new(2025, 9, 7, 21, 15),
  included_services: ["Hébergement", "Transport"],
  artist_experience_in_years: "5",
  duration_in_minutes: 75,
  available_tool: "Scène, DJ, micro",
  necessary_tool: "Piano électrique ou tout autre matériel nécessaire à votre performance",
  planned_remuneration: "Cachet",
  planned_remuneration_in_euros: 1000,
  event: demo_event,
  user: artist_persona,
  instruments: ['Voix', 'Piano']
)
#----------------
entertainment1 = Entertainment.create!(
  artist_type: "Groupe",
  starts_at: DateTime.new(2025, 9, 6, 20, 0),
  ends_at: DateTime.new(2025, 9, 6, 21, 30),
  included_services: ["Restauration"],
  artist_experience_in_years: "5",
  duration_in_minutes: 90,
  available_tool: "micro, cable",
  necessary_tool: "guitar enceinte ou autre",
  planned_remuneration: "au chapeau",
  planned_remuneration_in_euros: nil,
  event: event1,
  user: artiste1,
  instruments: ['Guitare acoustique', 'Voix']
)
#----------------
entertainment2 = Entertainment.create!(
  artist_type: "DJ",
  starts_at: DateTime.new(2025, 9, 7, 23, 0),
  ends_at: DateTime.new(2025, 9, 8, 1, 0),
  included_services: ["DJ Booth", "Lights"],
  artist_experience_in_years: "10",
  duration_in_minutes: 120,
  available_tool: "micro, cable",
  necessary_tool: "guitar, enceinte",
  planned_remuneration: "Facture",
  planned_remuneration_in_euros: 800,
  event: event0,
  user: artiste2,
  instruments: ['Synthétiseur', 'Guitare électrique']
)
entertainment3 = Entertainment.create!(
  artist_type: "Soliste",
  starts_at: DateTime.new(2025, 9, 5, 21, 0),
  ends_at: DateTime.new(2025, 9, 5, 22, 0),
  included_services: ["Scène", "Micro"],
  artist_experience_in_years: "3",
  duration_in_minutes: 60,
  available_tool: "micro, cable",
  necessary_tool: "guitar, enceinte",
  planned_remuneration: "Cachet",
  planned_remuneration_in_euros: 300,
  event: event1,
  user: nil,
  instruments: ['Guitare', 'Voix', 'Trompette']
)

entertainment4 = Entertainment.create!(
  artist_type: "Groupe",
  starts_at: DateTime.new(2025, 10, 10, 22, 0),
  ends_at: DateTime.new(2025, 10, 10, 23, 30),
  included_services: ["Transport"],
  artist_experience_in_years: "7",
  duration_in_minutes: 90,
  available_tool: "micro, cable",
  necessary_tool: "guitar, enceinte",
  planned_remuneration: "au chapeau",
  planned_remuneration_in_euros: nil,
  event: event2,
  user: nil,
  instruments: ['Guitare acoustique', 'Voix']
)
entertainment5 = Entertainment.create!(
  artist_type: "DJ",
  starts_at: DateTime.new(2025, 8, 20, 21, 0),
  ends_at: DateTime.new(2025, 8, 21, 23, 0),
  included_services: ["Logement"],
  artist_experience_in_years: "12",
  duration_in_minutes: 120,
  available_tool: "micro, cable",
  necessary_tool: "guitar, enceinte",
  planned_remuneration: "GUSO",
  planned_remuneration_in_euros: 1200,
  event: event3,
  user: nil,
  instruments: ["Saxophone", "Voix"]
)
entertainment6 = Entertainment.create!(
  artist_type: "Groupe",
  starts_at: DateTime.new(2025, 9, 5, 19, 0),
  ends_at: DateTime.new(2025, 9, 5, 20, 0),
  included_services: ["Transport", "Restauration"],
  artist_experience_in_years: "4",
  duration_in_minutes: 60,
  available_tool: "micro, cable",
  necessary_tool: "guitar, enceinte",
  planned_remuneration: "Cachet",
  planned_remuneration_in_euros: 400,
  event: event3,
  user: nil,
  instruments: ["Guitare électrique", "Saxophone"]
)

entertainment7 = Entertainment.create!(
  artist_type: "Soliste",
  starts_at: DateTime.new(2025, 9, 6, 18, 0),
  ends_at: DateTime.new(2025, 9, 6, 19, 0),
  included_services: ["Transport"],
  artist_experience_in_years: "2",
  duration_in_minutes: 60,
  available_tool: "micro, cable",
  necessary_tool: "guitar, enceinte",
  planned_remuneration: "Cachet",
  planned_remuneration_in_euros: 200,
  event: event3,
  user: artiste3,
  instruments: ["Guitare acoustique", "Voix"]
)

p "Entertainments created: #{Entertainment.count}"

# --- ENTERTAINMENT APPLICATIONS (liés aux entertainments + musiciens) ---
EntertainmentApplication.create!(
  status: "Accepté",
  message: "Je serais de participer à ce festival et partager mes compositions.",
  user: artiste1,
  entertainment: entertainment1,
  created_at: DateTime.new(2025, 6, 1, 14, 30)
)
EntertainmentApplication.create!(
  status: "Accepté",
  message: "Expérience confirmée en clubs électro, prêt pour une grosse soirée. Hate de bosser avec vous!",
  user: artiste2,
  entertainment: entertainment2,
  created_at: DateTime.new(2025, 7, 10, 19, 0)
)
EntertainmentApplication.create!(
  status: "En cours",
  message: "Envie de représenter la scène hip-hop locale avec énergie. Appelons-nous!",
  user: artiste1,
  entertainment: entertainment3,
  created_at: DateTime.new(2025, 8, 15, 16, 45)
)
EntertainmentApplication.create!(
  status: "Refusé",
  message: "Proposition intéressante mais le style ne correspond pas à l’événement.",
  user: artiste3,
  entertainment: entertainment4,
  created_at: DateTime.new(2025, 8, 20, 14, 30)
)

EntertainmentApplication.create!(
  status: "Accepté",
  message: "Expérience sur plusieurs festivals, matériel complet disponible.",
  user: artiste3,
  entertainment: entertainment5,
  created_at: DateTime.new(2025, 8, 25, 11, 15)
)
demo_entertainment_application1 = EntertainmentApplication.create!(
  status: "Accepté",
  message: "Je suis très motivée pour participer à cet événement et partager ma musique avec le public.",
  user: artist_persona,
  entertainment: demo_entertainment,
  created_at: DateTime.new(2025, 8, 15, 10, 45)
)

demo_entertainment_application2 = EntertainmentApplication.create!(
  status: "En cours",
  message: "Je suis très motivée pour participer à cet événement et partager ma musique avec le public.",
  user: artist_persona,
  entertainment: entertainment3,
  created_at: DateTime.new(2025, 8, 15, 10, 45)
)

demo_entertainment_application3 = EntertainmentApplication.create!(
  status: "Accepté",
  message: "Je suis très motivée pour participer à cet événement et partager ma musique avec le public.",
  user: artist_persona,
  entertainment: entertainment6,
  created_at:Date.today
)

EntertainmentApplication.create!(
  status: "Proposé",
  message: "Je dois rédiger mon message pour que l'orga confirme qu'il ME veut.",
  user: artist_persona,
  entertainment: entertainment2,
  created_at: Date.today
)

EntertainmentApplication.create!(
  status: "Validé",
  message: "J'accepte la proposition",
  user: artist_persona,
  entertainment: entertainment1,
  created_at: DateTime.new(2025, 6, 7, 14, 30)
)
EntertainmentApplication.create!(
  status: "Accepté",
  message: "J'accepte la proposition",
  user: artist_persona,
  entertainment: entertainment2,
  created_at: DateTime.new(2025, 9, 7, 14, 30)
)
p "Entertainment Applications created: #{EntertainmentApplication.count}"

# --- CHATS (liés aux entertainment applications) ---
 chat1 = Chat.create!(
  entertainment_application: EntertainmentApplication.first

)
Chat.create!(
  entertainment_application: EntertainmentApplication.second
)
Chat.create!(
  entertainment_application: EntertainmentApplication.third
)
Chat.create!(
  entertainment_application: demo_entertainment_application1
)
Chat.create!(
  entertainment_application: demo_entertainment_application2
)
Chat.create!(
  entertainment_application: demo_entertainment_application3
)
p "Chats created: #{Chat.count}"

# --- Messages aléatoires ---
sample_messages = [
  "Bonjour, je suis intéressé par votre candidature  !",
  "Merci pour votre réponse rapide.",
  "Pouvez-vous m'envoyer plus de détails ?",
  "Super, je serai présent !",
  "J'ai une question concernant le programme.",
  "Merci beaucoup pour l'information !",
  "C'est parfait, à bientôt.",
  "Je ne pourrai pas assister, désolé.",
  "Pouvez-vous confirmer l'heure exacte ?",
  "Merci, tout est clair maintenant."
]

# --- Créer des messages aléatoires pour chaque chat ---
Chat.all.each do |chat|

    Message.create!(
      chat: chat,
      user: artist_persona,
      content: sample_messages.sample
    )

end

p "Messages created: #{Message.count}"
