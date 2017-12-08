require_relative('../db/sql_runner')

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price'].to_i
  end

  def save
    film = SqlRunner.run('INSERT INTO films (title, price)
    VALUES ($1, $2) RETURNING *;', [@title, @price]).first
    @id = film['id'].to_i
  end

  def update
    sql = "UPDATE films
    SET (title, price) = ($1, $2)
    WHERE id = $3"
    values = [@title, @price, @id]
    customer = SqlRunner.run(sql, values)
  end

  def delete
    SqlRunner.run("DELETE FROM films WHERE id = $1", [@id])
  end

  def self.delete_all
    SqlRunner.run("DELETE FROM films;")
  end

  def self.all
    sql = 'SELECT * FROM films;'
    films = SqlRunner.run(sql)
    return Film.map_items(films)
  end

  def self.map_items(film_hashes)
    result = film_hashes.map{|film_hash| Film.new(film_hash)}
    return result
  end

end
