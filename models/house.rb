require('pry')
require_relative('../db/sql_runner')

class House
  attr_accessor :name, :logo_url
  attr_reader :id

  def initialize(details)
    @id = details['id'].to_i unless details['id'].nil?
    @name = details['name']
    @logo_url = details['logo_url']
  end

  def self.all()
    sql = "SELECT * FROM houses;"
    houses = SqlRunner.run(sql)
    return houses.map {|house| House.new(house)}
  end

  def self.find(id)
    sql = "SELECT * FROM houses WHERE id=#{id};"
    house = SqlRunner.run(sql)
    return House.new(house.first)
  end

  def self.students(id)
    sql = "SELECT * FROM students WHERE house_id = #{id}"
    students = SqlRunner.run(sql)
    return students.map {|student| Student.new(student)}
  end

end 