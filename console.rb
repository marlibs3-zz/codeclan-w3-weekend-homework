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
room2 = Room.new({ 'capacity' => '2' })
room2.save()

film1 = Film.new({ 'title' => 'The Room', 'price' => '10' })
film1.save()
film2 = Film.new({ 'title' => 'Shape of the Water', 'price' => '10' })
film2.save()

screening1 = Screening.new({ 'film_id' => '1', 'room_id' => '2', 'date_and_time' => '30-Mar-2018 20:00' })
screening1.save()
screening2 = Screening.new({ 'film_id' => '2', 'room_id' => '1', 'date_and_time' => '31-Mar-2018 20:00' })
screening2.save()

ticket1 = Ticket.new({ 'customer_id' => '1', 'screening_id' => '1' })
ticket1.save()
ticket2 = Ticket.new({ 'customer_id' => '2', 'screening_id' => '1' })
ticket2.save()
ticket2 = Ticket.new({ 'customer_id' => '3', 'screening_id' => '1' })
ticket2.save()
ticket2 = Ticket.new({ 'customer_id' => '3', 'screening_id' => '2' })
ticket2.save()

p customer3.screenings()

p screening1.customers()

p customer3.tickets()

p "I did the things"

# binding.pry
# nil
