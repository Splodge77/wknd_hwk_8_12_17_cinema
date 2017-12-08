require_relative('../db/sql_runner')

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def save
    ticket = SqlRunner.run('INSERT INTO tickets
      (customer_id, film_id)
      VALUES ($1,$2)
      RETURNING *;', [@customer_id, @film_id]).first
      @id = ticket['id'].to_i
    end

    def delete
      SqlRunner.run("DELETE FROM customers WHERE id = $1", [@id])
    end

    # def update
    #   sql = "UPDATE tikets
    #   SET (customer_id, film_id) = ($1, $2)
    #   WHERE id = $3"
    #   values = [@customer_id, @film_id, @id]
    #   customer = SqlRunner.run(sql, values)
    # end

    def self.delete_all
      SqlRunner.run("DELETE FROM tickets;")
    end

    def self.all
      sql = 'SELECT * FROM tickets;'
      tickets = SqlRunner.run(sql)
      return Ticket.map_items(tickets)
    end

    def self.map_items(ticket_hashes)
      result = ticket_hashes.map{|ticket_hash| Ticket.new(ticket_hash)}
      return result
    end

  end
