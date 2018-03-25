require_relative("../db/sql_runner")
require_relative("room")
require_relative("film")

class Screening

  attr_reader :id
  attr_accessor :film_id, :room_id, :date_and_time

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @film_id = options['film_id'].to_i
    @room_id = options['room_id'].to_i
    @date_and_time = options['date_and_time']
  end

  def self.drop()
    sql = "DROP TABLE IF EXISTS screenings;"
    SqlRunner.run(sql)
  end

  def self.create()
    sql = "CREATE TABLE screenings (
    id SERIAL4 PRIMARY KEY,
    film_id INT4 REFERENCES films(id) ON DELETE CASCADE,
    room_id INT4 REFERENCES rooms(id) ON DELETE CASCADE,
    date_and_time TIMESTAMP
    );"
    SqlRunner.run(sql)
  end

  def save()
    sql = "INSERT INTO screenings
    (
      film_id,
      room_id,
      date_and_time
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@film_id, @room_id, @date_and_time]
    screening = SqlRunner.run( sql,values ).first
    @id = screening['id'].to_i
  end

  def update()
    sql = "UPDATE screenings
    SET
    (
      film_id,
      room_id,
      date_and_time
    ) =
    (
      $1, $2, $3
    )
    WHERE id = $4"
    values = [@film_id, @room_id, @date_and_time, @id]
    SqlRunner.run(sql, values)
  end

end
