require_relative("../db/sql_runner")

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def self.drop()
    sql = "DROP TABLE IF EXISTS customers;"
    SqlRunner.run(sql)
  end

  def self.create()
    sql = "CREATE TABLE customers (
    id SERIAL4 PRIMARY KEY,
    name VARCHAR(255),
    funds INT
    );"
    SqlRunner.run(sql)
  end

  def save()
    sql = "INSERT INTO customers
    (
      name,
      funds
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run( sql,values ).first
    @id = customer['id'].to_i
  end

end
