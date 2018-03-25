# require_relative("../db/sql_runner")

class Room

  attr_reader :id
  attr_accessor :capacity

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @capacity = options['capacity'].to_i
  end

  def self.drop()
    sql = "DROP TABLE IF EXISTS rooms;"
    SqlRunner.run(sql)
  end

  def self.create()
    sql = "CREATE TABLE rooms (
      id SERIAL4 PRIMARY KEY,
      capacity INT
    );"
    SqlRunner.run(sql)
  end

  def save()
    sql = "INSERT INTO rooms
    (
      capacity
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@capacity]
    room = SqlRunner.run( sql,values ).first
    @id = room['id'].to_i
  end

end
