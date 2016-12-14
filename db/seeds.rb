require('pry')
require_relative( '../models/student.rb')

student1 = Student.new({
  'first_name' => 'Harrison',
  'last_name' => 'Booth',
  'age' => 19,
  'house' => 'Slytherin'
  })

student2 = Student.new({
  'first_name' => 'Amy',
  'last_name' => 'Robinson',
  'age' => 26,
  'house' => 'Ravenclaw'
  })

student1.save()
student2.save()


binding.pry
nil