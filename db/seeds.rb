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
