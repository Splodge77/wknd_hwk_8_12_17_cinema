require_relative('../db/sql_runner')

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save
    sql = "INSERT INTO customers (name, funds)
    VALUES ($1,$2) RETURNING *"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

  def self.delete_all
    SqlRunner.run("DELETE FROM customers;")
  end

  def self.all
    sql = 'SELECT * FROM customers;'
    customers = SqlRunner.run(sql)
    return Customer.map_items(customers)
  end

  def self.map_items(customer_hashes)
    result = customer_hashes.map{|customer_hash| Customer.new(customer_hash)}
    return result
  end


end
