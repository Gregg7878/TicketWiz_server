# Create Customers
puts '🌱 Seeding database...'
begin

  Organiser.destroy_all
  Customer.destroy_all
  Event.destroy_all
  Ticket.destroy_all
  CalendarEvent.destroy_all
  Payment.destroy_all

# customers
customer1 = Customer.create(first_name: "Jane", last_name: "Kwamboka", email: "janek@gmail.com", password: "JaneKwamboka1", phone_number: 254724356359, age: 27)
customer2 = Customer.create(first_name: "Jude", last_name: "Kuria", email: "judek@gmail.com", password: "JudeKuria1", phone_number: 254711113359, age: 35)

# organisers
organiser1 = Organiser.create(first_name: "Lance", last_name: "Lentoijoni", email: "lancel@gmail.com", password: "LanceLentoijoni1", phone_number: 254792341243, age: 19)
organiser2 = Organiser.create(first_name: "Lucille", last_name: "Ogot", email: "lucilleo@gmail.com", password: "LucilleOgot1", phone_number: 254723234343, age: 32)
organiser3 = Organiser.create(first_name: "David", last_name: "M", email: "davidm@gmail.com", password: "DavidM1", phone_number: 254712312333, age: 32)

# events
event1 = Event.create(title: "InnoCon 2023", description: "Join thought leaders, innovators, and visionaries at InnoCon 2023, a platform for sharing groundbreaking ideas, innovations, and shaping the future. Explore emerging trends, engage in insightful discussions, and network with the brightest minds in the field.", category: "Conferences", image_url: "https://i.pinimg.com/564x/db/7c/96/db7c96d6d6e10290bcf86900c5a6b3e4.jpg", 
        date: Date.parse("2023-12-20"), start_time: "9:00 AM", end_time: "5:00 PM", venue_name: "TechHub Hall", event_location: "Nakuru", available_tickets_count: 100, price: 1400, 
        organiser_id: organiser1.id)
event2 = Event.create(title: "Haka BurgerFest", description: "Burger lovers, unite! Get ready for a carnivore's dream at BurgerFest, the ultimate burger experience. We're grilling up a storm with juicy patties, gourmet toppings, and mouthwatering buns. Haka BurgerFest has it all. ", category: "Feast Event", image_url: "https://i.pinimg.com/564x/c9/ea/de/c9eaded11619655ed0e61a869a904a83.jpg", 
        date: Date.parse("2023-11-12"), start_time: Time.parse("11:00 AM"), end_time: Time.parse("5:00 PM"), venue_name: "Parena Gardens", event_location: "Nairobi", available_tickets_count: 200, price: 1500, 
        organiser_id: organiser1.id)
event3 = Event.create(title: "HopeRaiser Ball", description: "It's an opportunity to make a meaningful impact as you enjoy a splendid evening. Your presence contributes to noble causes and the betterment of communities in need. Join us for an evening of philanthropy, compassion, and hope.", category: "Charity Events", image_url: "https://i.pinimg.com/564x/fe/5e/68/fe5e688cac676377dd858ffdaca2a97e.jpg", 
        date: Date.parse("2023-11-20"), start_time: Time.parse("3:00 AM"), end_time: Time.parse("7:00 PM"), venue_name: "UnityCare Plaza", event_location: "Nairobi", available_tickets_count: 500, price: 10, 
        organiser_id: organiser2.id)
event4 = Event.create(title: "Adrenaline Rush", description: "The Adrenaline Rush Games bring together individuals from various backgrounds to compete in heart-pounding challenges and showcase their skills. Join us for an event that celebrates sportsmanship, competition, and the joy of pushing one's limits.", category: "Sporting Events", image_url: "https://i.pinimg.com/564x/4e/ef/86/4eef868359ce32a10dcc5f82f468b4b5.jpg", 
        date: Date.parse("2024-01-10"), start_time: Time.parse("8:00 AM"), end_time: Time.parse("7:00 PM"), venue_name: "SportsHub Arena", event_location: "Malindi", available_tickets_count: 100, price: 1000, 
        organiser_id: organiser3.id)
event5 = Event.create(title: "Jazz Jamboree", description: "Renowned artists and rising stars will grace the stage, delivering soul-stirring performances that span genres. Let the harmonious melodies transport you to a world of musical magic.", category: "Concerts", image_url: "https://i.pinimg.com/564x/d2/86/94/d2869449f189e261ddb9eab581d78031.jpg", 
        date: Date.parse("2023-12-20"), start_time: Time.parse("3:00 PM"), end_time: Time.parse("11:00 PM"), venue_name: "Jakarta Convention Center", event_location: "Eldoret", available_tickets_count: 45, price: 5000, 
        organiser_id: organiser3.id)
event6 = Event.create(title: "Mali Party", description: "A high-energy dance party where vibrant beats, neon lights, and lively rhythms set the stage for an electrifying night. It's a celebration of life, fun, and unity, where you're invited to let loose and dance the night away.", category: "Parties", image_url: "https://i.pinimg.com/564x/11/d6/a5/11d6a5d7dfc1331babe420daa55c0bd0.jpg", 
        date: Date.parse("2023-12-29"), start_time: Time.parse("5:00 PM"), end_time: Time.parse("5:00 AM"), venue_name: "Underground club", event_location: "Nairobi", available_tickets_count: 120, price: 2500, 
        organiser_id: organiser1.id)
event7 = Event.create(title: "CodeCrunch", description: "This is where innovation and collaboration come together to create solutions for real-world challenges. Join us in the pursuit of groundbreaking solutions.", category: "Tech and Hackathons", image_url: "https://i.pinimg.com/564x/73/ea/0a/73ea0a10b09f1af036eb2f2bbd315f08.jpg", 
        date: Date.parse("2023-11-11"), start_time: Time.parse("9:00 AM"), end_time: Time.parse("5:00 PM"), venue_name: "Sarit Center", event_location: "Nairobi", available_tickets_count: 100, price: 100, 
        organiser_id: organiser2.id)
event8 = Event.create(title: "Artistic Odyssey", description: "This exhibition showcases the work of talented artists, offering a unique blend of creativity and inspiration. Wander through the gallery and immerse yourself in the world of art.", category: "Art Shows", image_url: "https://i.pinimg.com/564x/cf/6a/67/cf6a6752d9e31da38e683a2fab9811b8.jpg", 
        date: Date.parse("2023-12-01"), start_time: Time.parse("9:00 AM"), end_time: Time.parse("5:00 PM"), venue_name: "Nairobi National Museum", event_location: "Nairobi", available_tickets_count: 300, price: 200, 
        organiser_id: organiser2.id)
event9 = Event.create(title: "Heritage Fest", description: "This is a celebration of diverse cultures and traditions. Immerse yourself in a colorful world of customs, cuisine, art, and music. Explore the rich tapestry of human heritage and experience the beauty of unity in diversity.", category: "Cultural", image_url: "https://i.pinimg.com/564x/a3/16/b5/a316b50cf4ffa57ab8c82cd59dd7a4bd.jpg", 
        date: Date.parse("2023-12-20"), start_time: Time.parse("11:30 AM"), end_time: Time.parse("4:30 PM"), venue_name: "Heritage Center", event_location: "Mombasa", available_tickets_count: 100, price: 2000, 
        organiser_id: organiser3.id)
event10 = Event.create(title: "Munchie Piccu", description: "Satisfy your taste buds with an epicurean adventure at the Munchie Piccu. Indulge in a diverse array of culinary delights, from international flavors to local favorites. ", category: "Feast Event", image_url: "https://i.pinimg.com/564x/e2/ed/ec/e2edec1a8ff1a792c6e8584cd2afe49a.jpg", 
        date: Date.parse("2023-11-22"), start_time: Time.parse("9:00 AM"), end_time: Time.parse("9:00 PM"), venue_name: "Manga Street", event_location: "Nairobi", available_tickets_count: 100, price: 1400, 
        organiser_id: organiser3.id)
event11 = Event.create(title: "ConnectXperience", description: "Unleash the power of connections at ConnectXperience, a gala designed to help you expand your professional and social network. With a dynamic atmosphere and curated interactions, this event provides the ideal platform for forging valuable connections, partnerships, and friendships. Get ready for an unforgettable networking journey.", category: "Networking Events", image_url: "https://i.pinimg.com/564x/62/bc/0f/62bc0feb60ef3e3e81ea837dea4e369d.jpg", 
        date: Date.parse("2023-12-20"), start_time: Time.parse("9:00 AM"), end_time: Time.parse("5:00 PM"), venue_name: "Techlink", event_location: "Nakuru", available_tickets_count: 100, price: 1100, 
        organiser_id: organiser1.id)
event12 = Event.create(title: "Rubia Divino", description: "The Enchanted Nights Theater is where storytelling comes to life through the mesmerizing performances of talented artists. Each act is a captivating narrative told through dance, music, and drama. Join us for a night of enchantment and experience stories like never before.", category: "Performing Arts", image_url: "https://i.pinimg.com/564x/ac/b9/0b/acb90b471653d2ff15b1b3737bc78647.jpg", 
        date: Date.parse("2023-12-20"), start_time: Time.parse("9:00 AM"), end_time: Time.parse("5:00 PM"), venue_name: "Symphony Hall", event_location: "Nakuru", available_tickets_count: 100, price: 1400, 
        organiser_id: organiser2.id)
event13 = Event.create(title: "Gourmet Gala", description: "Indulge in a diverse array of culinary delights, from international flavors to local favorites. This gastronomic celebration promises an unforgettable journey of flavors, aromas, and culinary craftsmanship.", category: "Feast Event", image_url: "https://i.pinimg.com/564x/5a/72/93/5a729346b3e3d1c7bcbd59dd3dbe383e.jpg", 
        date: Date.parse("2023-10-30"), start_time: Time.parse("11:00 AM"), end_time: Time.parse("5:00 PM"), venue_name: "Paradise gardens", event_location: "Kisumu", available_tickets_count: 150, price: 2450, 
        organiser_id: organiser1.id)

# tickets
ticket1 = Ticket.create(event_id: event4.id, customer_id: customer1.id, ticket_type: "MVP", quantity: 2)
ticket2 = Ticket.create(event_id: event10.id, customer_id: customer2.id, ticket_type: "Early Booking", quantity: 3)
ticket3 = Ticket.create(event_id: event5.id, customer_id: customer2.id, ticket_type: "Regular", quantity: 6)

# calendar events
calendar_event1 = CalendarEvent.create(event_id: event4.id, customer_id: customer1.id, organiser_id: organiser3.id)
calendar_event2 = CalendarEvent.create(event_id: event10.id, customer_id: customer2.id, organiser_id: organiser3.id)
calendar_event3 = CalendarEvent.create(event_id: event5.id, customer_id: customer2.id, organiser_id: organiser3.id)

# # payment
payment1 = Payment.create(ticket_id: ticket1.id, amount: ticket1.calculate_price * ticket1.quantity, status: 'completed', transaction_id: SecureRandom.uuid, timestamp: Time.now)
payment2 = Payment.create(ticket_id: ticket2.id, amount: ticket2.calculate_price * ticket2.quantity, status: 'completed', transaction_id: SecureRandom.uuid, timestamp: Time.now)
payment3 = Payment.create(ticket_id: ticket3.id, amount: ticket3.calculate_price * ticket3.quantity, status: 'completed', transaction_id: SecureRandom.uuid, timestamp: Time.now)

puts "✅ Data successfully seeded!"
end
