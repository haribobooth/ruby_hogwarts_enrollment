require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('./models/student')

#index students
get('/students') do
  @students = Student.all()
  erb(:index)
end

#new student form
get('/students/new') do
  erb(:new)
end

#show a student
get('/students/:id') do
  search_id = params[:id]
  @student = Student.find(search_id)
  erb(:show)
end

#create new student
post('/students') do
  @student = Student.new( params )
  @student.save()
  erb(:create)
end

#DESTROY student


#edit student form
get('/students/:id/edit') do
  @student = Student.find(params[:id])
  erb(:edit)
end

#update student
post('/students/:id') do
  Student.update(params)
  redirect to("/students/#{params[:id]}")
end
