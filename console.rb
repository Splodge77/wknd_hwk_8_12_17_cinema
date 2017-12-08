require('pry-byebug')
require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')

customer1 = Customer.new ({
  'name' => 'Mikey',
  'funds' => '100'
  })

 customer1.save()

film1 = Film.new ({
  'title' => 'Fantasia',
  'price' => '10'
  })

  film1.save()


binding.pry
nil
