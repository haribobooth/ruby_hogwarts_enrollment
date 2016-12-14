require('pry')
require_relative('../db/sql_runner')

class Student  
  attr_reader :id
  attr_accessor :first_name, :last_name, :age, :house

  def initialize(details)
    @id = details['id'].to_i unless details['id'].nil?
    @first_name = details['first_name']
    @last_name = details['last_name']
    @age = details['age'].to_i
    @house = details['house']
    # @house_id = details['house_id'].to_i unless details['house_id'].nil?
  end


  def save()
    sql = "INSERT INTO students (first_name, last_name, age, house) VALUES ('#{@first_name}', '#{@last_name}', #{@age}, '#{@house}') RETURNING *;"
    @id = SqlRunner.run(sql)[0]['id'].to_i 
  end

  def self.all()
    sql = "SELECT * FROM students;"
    students = SqlRunner.run(sql)
    return students.map {|student| Student.new(student)}
  end

  def self.find(id)
    sql = "SELECT * FROM students WHERE id=#{id};"
    student = SqlRunner.run(sql)
    return Student.new(student.first)
  end

  def self.destroy(id)
    sql = "DELETE FROM students WHERE id = #{id};"
    SqlRunner.run(sql)
  end

  def self.update(details)
    sql = "UPDATE students SET
          first_name='#{details['first_name']}',
          last_name='#{details['last_name']}',
          age=#{details['age']},
          house='#{details['house']}'
          WHERE id='#{details['id']}'"
    SqlRunner.run(sql)
  end
end