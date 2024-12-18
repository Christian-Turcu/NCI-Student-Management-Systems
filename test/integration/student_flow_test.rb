require "test_helper"

class StudentFlowTest < ActionDispatch::IntegrationTest
  test "can browse index" do
    get "/students"
    assert_response :success
  end

  test "can create a new student" do
    get "/students/new"
    assert_response :success

    post "/students",
      params: { student: { name: "Test Student", 
                          email: "test@example.com",
                          student_number: "12345",
                          course: "Test Course" } }
    
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test "can view a student" do
    student = Student.create(
      name: "Test Student",
      email: "test@example.com",
      student_number: "12346",
      course: "Test Course"
    )

    get student_url(student)
    assert_response :success
  end
end
