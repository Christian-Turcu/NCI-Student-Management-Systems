require "test_helper"

class StudentTest < ActiveSupport::TestCase
  test "should not save student without name" do
    student = Student.new(email: "test@example.com", student_number: "STN999", course: "Computer Science")
    assert_not student.save, "Saved student without a name"
  end

  test "should not save student without student number" do
    student = Student.new(name: "John Doe", email: "test@example.com", course: "Computer Science")
    assert_not student.save, "Saved student without a student number"
  end

  test "should save valid student" do
    student = Student.new(
      name: "John Doe",
      email: "john@example.com",
      student_number: "STN100",
      course: "Computer Science"
    )
    assert student.save, "Could not save valid student"
  end

  test "should not save student with duplicate student number" do
    student1 = Student.new(
      name: "John Doe",
      email: "john@example.com",
      student_number: "STN100",
      course: "Computer Science"
    )
    student1.save

    student2 = Student.new(
      name: "Jane Doe",
      email: "jane@example.com",
      student_number: "STN100",
      course: "Information Technology"
    )
    assert_not student2.save, "Saved student with duplicate student number"
  end
end
