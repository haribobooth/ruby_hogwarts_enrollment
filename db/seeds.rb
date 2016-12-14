require('pry')
require_relative( '../models/student.rb')
require_relative( '../models/house.rb')

student1 = Student.new({
  'first_name' => 'Harrison',
  'last_name' => 'Booth',
  'age' => 19,
  'house_id' => 3
  })

student2 = Student.new({
  'first_name' => 'Amy',
  'last_name' => 'Robinson',
  'age' => 26,
  'house_id' => 4
  })

student1.save()
student2.save()


binding.pry
nil