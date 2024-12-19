require "application_system_test_case"

class StudentsTest < ApplicationSystemTestCase
  setup do
    @student = students(:one)
  end

  test "visiting the index" do
    visit students_url
    assert_selector "h1", text: "Students"
  end

  test "should create student" do
    visit students_url
    click_on "New Student"

    fill_in "Name", with: "Test Student"
    fill_in "Email", with: "test@example.com"
    fill_in "Course", with: "Test Course"
    fill_in "Student number", with: "ST003"
    click_on "Create Student"

    assert_text "Student was successfully created"
  end

  test "should update Student" do
    visit student_url(@student)
    click_on "Edit", match: :first

    fill_in "Name", with: "Updated Student"
    fill_in "Email", with: "updated@example.com"
    fill_in "Course", with: "Updated Course"
    click_on "Update Student"

    assert_text "Student was successfully updated"
  end

  test "should destroy Student" do
    visit students_url
    click_on "Show", match: :first
    click_on "Delete Student"
    
    page.accept_confirm do
      click_on "OK"
    end

    assert_text "Student was successfully deleted"
  end

  test "should search students" do
    visit students_url
    fill_in "search", with: @student.name
    click_on "Search"
    
    assert_text @student.name
  end
end
