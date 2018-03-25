require_relative("models/customer")
require_relative("models/film")
require_relative("models/room")
require_relative("models/screening")
require_relative("models/ticket")

# require( 'pry-byebug' )

Ticket.drop()
Screening.drop()
Film.drop()
Room.drop()
Customer.drop()
Customer.create()
Room.create()
Film.create()
Screening.create()
Ticket.create()

customer1 = Customer.new({ 'name' => 'Marta', 'funds' => '50' })
customer1.save()
customer2 = Customer.new({ 'name' => 'Andrew', 'funds' => '50' })
customer2.save()
customer3 = Customer.new({ 'name' => 'Craig', 'funds' => '50' })
customer3.save()

room1 = Room.new({ 'capacity' => '100' })
room1.save()

film1 = Film.new({ 'title' => 'The Room', 'price' => '10' })
film1.save()

screening1 = Screening.new({ 'film_id' => '1', 'room_id' => '1', 'date_and_time' => '30-Mar-2018 20:00' })
screening1.save()

ticket1 = Ticket.new({ 'customer_id' => '2', 'screening_id' => '1' })
ticket1.save()

# binding.pry
# nil
