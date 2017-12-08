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

end
