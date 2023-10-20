# # Clear existing data
# Customer.destroy_all
# Organiser.destroy_all
# Event.destroy_all
# Ticket.destroy_all
# CalendarEvent.destroy_all
# Payment.destroy_all

# # Create customers
# customer1 = Customer.create!(
#   first_name: 'John',
#   last_name: 'Doe',
#   email: 'john@example.com',
#   password: 'Pass@word_1',
#   phone_number: '1234567890',
#   age: 30
# )

# # Create organizers
# organizer1 = Organiser.create!(
#   first_name: 'Jane',
#   last_name: 'Smith',
#   email: 'jane@example.com',
#   password: 'Pass@word_1',
#   phone_number: '5555555555',
#   age: 35
# )

# # Create events associated with an organizer
# event1 = Event.create!(
#   title: 'Event 1',
#   date: Date.tomorrow,
#   start_time: Time.now,
#   end_time: 2.hours.from_now,
#   organiser: organizer1
# )

# # Create tickets associated with an event and a customer
# ticket1 = Ticket.create!(
#   event: event1,
#   customer: customer1,
#   ticket_type: 'General',
#   price: 20.00,
#   purchase_date: Date.today
# )

# # Create more records if needed

# puts "Seed data created successfully!"
