require_relative("../db/sql_runner")
require_relative("customer")
require_relative("screening")

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :screening_id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @screening_id = options['screening_id'].to_i
  end

  def self.drop()
    sql = "DROP TABLE IF EXISTS tickets;"
    SqlRunner.run(sql)
  end

  def self.create()
    sql = "CREATE TABLE tickets (
    id SERIAL4 PRIMARY KEY,
    customer_id INT4 REFERENCES customers(id) ON DELETE CASCADE,
    screening_id INT4 REFERENCES screenings(id) ON DELETE CASCADE
    );"
    SqlRunner.run(sql)
  end

  def save()
    sql = "INSERT INTO tickets
    (
      customer_id,
      screening_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@customer_id, @screening_id]
    ticket = SqlRunner.run( sql,values ).first
    @id = ticket['id'].to_i
  end

  def update()
    sql = "UPDATE tickets
    SET
    (
      customer_id,
      screening_id
    ) =
    (
      $1, $2
    )
    WHERE id = $3"
    values = [@customer_id, @screening_id, @id]
    SqlRunner.run(sql, values)
  end

end
