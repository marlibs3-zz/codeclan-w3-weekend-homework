require_relative("../db/sql_runner")

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price'].to_i
  end

  def self.drop()
    sql = "DROP TABLE IF EXISTS films;"
    SqlRunner.run(sql)
  end

  def self.create()
    sql = "CREATE TABLE films (
      id SERIAL4 PRIMARY KEY,
      title VARCHAR(255),
      price INT
    );"
    SqlRunner.run(sql)
  end

  def save()
    sql = "INSERT INTO films
    (
      title,
      price
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@title, @price]
    film = SqlRunner.run( sql,values ).first
    @id = film['id'].to_i
  end

end
