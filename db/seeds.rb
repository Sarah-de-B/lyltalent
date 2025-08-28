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
  artist_name: "Sarah Star",
  phone_number: "0611223344",
  role: "musician",
  address: "Paris",
  instruments: ["Chant"],
  musical_styles: ["Pop", "Soul"],
  covers: true,
  original_composition: true,
  stage_time_in_minutes: 75,
  tools: "Microphone Shure",
  tools_needed: "Piano électrique",
  concert_number: 15,
  bio: "Chanteuse passionnée, mélange pop et soul, connue pour ses performances vibrantes sur scène.",
  artist_type: "soliste",
  vehicule: false,
  date_of_birth: Date.new(1995, 6, 10),
  epk_completed: true
)
puts "created en cours"
file = Rails.root.join("db/seeds/users/sarah.jpeg").open
artist_persona.photos.attach(io: file, filename: "photo.jpg", content_type: "image/jpeg")
puts "done"
artist_persona.save!
# p artist_persona.valid?
# p artist_persona.errors.messages
# p artist_persona.id
file = Rails.root.join("db/seeds/users/videos/sarah_show.mp4").open
artist_persona.videos.attach(io: file, filename: "sarah_show.mp4", content_type: "video/mp4")
# :guitare: Musicians
musician1 = User.new(
  email: "jules.d@example.com",
  password: "password123",
  last_name: "Durand",
  first_name: "Julien",
  artist_name: "Jules D.",
  phone_number: "0612345678",
  role: "musician",
  address: "Nantes",
  instruments: ["Guitare", "Chant"],
  musical_styles: ["Pop", "Folk"],
  covers: true,
  original_composition: true,
  stage_time_in_minutes: 90,
  tools: "Ampli Fender",
  tools_needed: "Batterie électronique",
  concert_number: 25,
  bio: "Auteur-compositeur passionné par les sonorités acoustiques modernes.",
  artist_type: "soliste",
  vehicule: true,
  date_of_birth: Date.new(1993, 4, 15),
  epk_completed: true
)
file = Rails.root.join("db/seeds/users/julien.jpg").open
musician1.photos.attach(io: file, filename: "photo.jpg", content_type: "image/jpeg")

musician1.save!
puts "musician1 valid? #{musician1.valid?}"

musician2 = User.new(
  email: "sofi.beats@example.com",
  password: "password123",
  last_name: "Nguyen",
  first_name: "Sophie",
  artist_name: "Sofi Beats",
  phone_number: "0678123456",
  role: "musician",
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
musician2.photos.attach(io: file, filename: "photo.jpg", content_type: "image/jpeg")

musician2.save!
puts "musician2 valid? #{musician2.valid?}"

musician3 = User.new(
  email: "krimflow@example.com",
  password: "password123",
  last_name: "Benali",
  first_name: "Karim",
  artist_name: "K-Rim Flow",
  phone_number: "0654781234",
  role: "musician",
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
musician3.photos.attach(io: file, filename: "photo.jpg", content_type: "image/jpeg")

musician3.save!
puts "musician3 valid? #{musician3.valid?}"

# :micro: Event Planners
event_planner1 = User.create!(
  email: "sarah.events@example.com",
  password: "password123",
  last_name: "Martin",
  first_name: "Anetta",
  phone_number: "0645781234",
  role: "event_planner",
  address: "Bordeaux",
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
  role: "event_planner",
  address: "Toulouse",
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
  role: "event_planner",
  address: "Marseille",
  bio: "Directrice d'agence événementielle, experte en booking d’artistes."
)
file = Rails.root.join("db/seeds/users/amelie.jpg").open
event_planner3.photos.attach(io: file, filename: "photo.jpg", content_type: "image/jpeg")

# --- EVENTS (liés aux event planners) ---
demo_event = Event.create!(
  category: "Concert",
  duration: 90,
  address: "Salle de la Demo, Paris",
  estimated_public_in_number: 100,
  public_age: 20,
  musical_styles: ["Pop", "Soul"],
  cover_or_composition: "composition",
  number_of_artists_needed: 1,
  name: "Soirée a la salle de la Demo, Chant",
  description: "Première performance live de Sarah pour la démo.",
  vehicule: false,
  date: Date.new(2025, 10, 5),
  user: event_planner1 # tu peux réutiliser un event planner existant
)
file = Rails.root.join("db/seeds/events/Soiree_Demo_Sarah.jpg").open
demo_event.photo.attach(io: file, filename: "photo.jpg", content_type: "image/jpeg")

event1 = Event.create!(
  category: "Festival",
  duration: 180,
  address: "Parc des Chantiers, Nantes",
  estimated_public_in_number: 500,
  public_age: 25,
  musical_styles: ["Pop", "Folk"],
  cover_or_composition: "composition",
  number_of_artists_needed: 3,
  name: "Festival d'Été",
  description: "Festival annuel mettant en avant des artistes émergents.",
  vehicule: true,
  date: Date.new(2025, 7, 15),
  user: event_planner1
)
file = Rails.root.join("db/seeds/events/Festival_d_ete.jpg").open
event1.photo.attach(io: file, filename: "photo.jpg", content_type: "image/jpeg")

event2 = Event.create!(
  category: "Club",
  duration: 240,
  address: "Rex Club, Paris",
  estimated_public_in_number: 300,
  public_age: 22,
  musical_styles: ["Electro", "House"],
  cover_or_composition: "composition",
  number_of_artists_needed: 1,
  name: "Soirée Electro",
  description: "Nuit électro avec des DJs français et internationaux.",
  vehicule: false,
  date: Date.new(2025, 8, 20),
  user: event_planner2
)
file = Rails.root.join("db/seeds/events/soiree_electro.jpeg").open
event2.photo.attach(io: file, filename: "photo.jpg", content_type: "image/jpeg")

event3 = Event.create!(
  category: "Concert",
  duration: 120,
  address: "Maison de la Jeunesse, Lyon",
  estimated_public_in_number: 200,
  public_age: 20,
  musical_styles: ["Hip-hop", "Rap"],
  cover_or_composition: "composition",
  number_of_artists_needed: 3,
  name: "Open Mic Hip-Hop",
  description: "Scène ouverte pour les rappeurs et beatboxers.",
  vehicule: false,
  date: Date.new(2025, 9, 5),
  user: event_planner3
)
file = Rails.root.join("db/seeds/events/open mic_hip_hop.jpeg").open
event3.photo.attach(io: file, filename: "photo.jpg", content_type: "image/jpeg")

# --- ENTERTAINMENTS (liés aux musiciens + events) ---
demo_entertainment = Entertainment.create!(
  artist_type: "soliste",
  starts_at: DateTime.new(2025, 10, 5, 20, 0),
  ends_at: DateTime.new(2025, 10, 5, 21, 15),
  included_services: ["Micro", "Lumières"],
  artist_experience_in_years: "5",
  duration_in_minutes: 75,
  available_tool: "Micro Shure",
  necessary_tool: "Piano électrique",
  planned_remuneration: "Cachet démo",
  planned_remuneration_in_euros: nil,
  event: demo_event,
  user: artist_persona
)
entertainment1 = Entertainment.create!(
  artist_type: "groupe",
  starts_at: DateTime.new(2025, 7, 15, 20, 0),
  ends_at: DateTime.new(2025, 7, 15, 21, 30),
  included_services: ["Sonorisation", "Éclairage"],
  artist_experience_in_years: "5",
  duration_in_minutes: 90,
  available_tool: "micro, cable",
  necessary_tool: "guitar enceinte",
  planned_remuneration: "Cachet",
  planned_remuneration_in_euros: 400,
  event: event1,
  user: musician1
)
entertainment2 = Entertainment.create!(
  artist_type: "DJ",
  starts_at: DateTime.new(2025, 8, 20, 23, 0),
  ends_at: DateTime.new(2025, 8, 21, 1, 0),
  included_services: ["DJ Booth", "Lights"],
  artist_experience_in_years: "10",
  duration_in_minutes: 120,
  available_tool: "micro, cable",
  necessary_tool: "guitar, enceinte",
  planned_remuneration: "Facture",
  planned_remuneration_in_euros: 800,
  event: event1,
  user: musician2
)
entertainment3 = Entertainment.create!(
  artist_type: "soliste",
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
  user: nil
)
# --- ENTERTAINMENT APPLICATIONS (liés aux entertainments + musiciens) ---
EntertainmentApplication.create!(
  status: "accepted",
  message: "Ravi de participer à ce festival et partager mes compositions.",
  user: musician1,
  entertainment: entertainment1,
  created_at: DateTime.new(2025, 6, 1, 14, 30)
)
EntertainmentApplication.create!(
  status: "accepted",
  message: "Expérience confirmée en clubs électro, prêt pour une grosse soirée.",
  user: musician2,
  entertainment: entertainment2,
  created_at: DateTime.new(2025, 7, 10, 19, 0)
)
EntertainmentApplication.create!(
  status: "pending",
  message: "Envie de représenter la scène hip-hop locale avec énergie.",
  user: musician3,
  entertainment: entertainment3,
  created_at: DateTime.new(2025, 8, 15, 16, 45)
)
demo_entertainment_application = EntertainmentApplication.create!(
  status: "accepted",
  message: "Je suis très motivée pour participer à cet événement et partager ma musique avec le public.",
  user: artist_persona,
  entertainment: demo_entertainment,
  created_at: DateTime.new(2025, 8, 15, 10, 45)
)
