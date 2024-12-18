require "test_helper"

class StudentTest < ActiveSupport::TestCase
  test "should not save student without name" do
    student = Student.new
    assert_not student.save
  end

  test "should save valid student" do
    student = Student.new(
      name: "Test Student",
      email: "test@example.com",
      student_number: "12345",
      course: "Test Course"
    )
    assert student.save
  end

  test "should not save student with invalid email" do
    student = Student.new(
      name: "Test Student",
      email: "invalid-email",
      student_number: "12346",
      course: "Test Course"
    )
    assert_not student.save
  end
end
