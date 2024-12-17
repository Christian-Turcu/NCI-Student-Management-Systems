# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create sample students
students_data = [
  {
    name: 'John Doe',
    email: 'john.doe@example.com',
    student_number: 'STN001',
    course: 'Computer Science'
  },
  {
    name: 'Jane Smith',
    email: 'jane.smith@example.com',
    student_number: 'STN002',
    course: 'Information Technology'
  },
  {
    name: 'Michael Johnson',
    email: 'michael.j@example.com',
    student_number: 'STN003',
    course: 'Data Science'
  }
]

students_data.each do |student_data|
  Student.create!(student_data)
end
