require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')
require('pry-byebug')

Ticket.delete_all
Customer.delete_all
Film.delete_all

customer1 = Customer.new ({
  'name' => 'Mikeeeey',
  'funds' => '100'
  })

customer1.save()

customer2 = Customer.new ({
  'name' => 'Donald',
  'funds' => '20'
  })

customer2.save()

film1 = Film.new ({
  'title' => 'Fantasia',
  'price' => '10'
  })

film1.save()

ticket1 = Ticket.new ({
  'customer_id' => customer1.id,
  'film_id' => film1.id
  })

ticket1.save

customer1.name = 'Mickey'
customer1.update

binding.pry
nil
