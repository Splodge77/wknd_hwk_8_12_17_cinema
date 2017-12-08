require_relative('../db/sql_runner')
require_relative('customer')
require_relative('film')

class Ticket

  def initialize(options)
    @id = options('id').to_i
    @customer_id = options('customer_id').to_i
    @film_id = options('film_id').to_i
  end

end
