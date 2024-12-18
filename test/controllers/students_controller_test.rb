# Integration tests for StudentsController (LO3: Test-Driven Development)
# Demonstrates comprehensive testing of CRUD operations
class StudentsControllerTest < ActionDispatch::IntegrationTest
  # Test setup: Creates test data and configures environment
  # Runs before each test case
  setup do
    @student = students(:one)  # Uses fixtures for test data
    # Temporarily disable CSRF for testing API endpoints
    Rails.application.config.action_controller.allow_forgery_protection = false
  end

  # Test cleanup: Restores original configuration
  # Runs after each test case
  teardown do
    Rails.application.config.action_controller.allow_forgery_protection = true
  end

  # Tests index action (Read operation)
  # Verifies successful page load and response
  test "should get index" do
    get students_url
    assert_response :success  # Expects HTTP 200 status
  end

  # Tests new action (Create operation setup)
  # Verifies form display functionality
  test "should get new" do
    get new_student_url
    assert_response :success
  end

  # Tests create action (Create operation)
  # Verifies successful student creation and redirect
  test "should create student" do
    # Verifies database record creation
    assert_difference("Student.count") do
      post students_url, params: { 
        student: { 
          name: "Test Student",
          email: "test@example.com",
          course: "Test Course",
          student_number: "ST003"
        } 
      }
    end
    # Verifies proper redirect after creation
    assert_redirected_to student_url(Student.last)
  end

  # Tests show action (Read operation)
  # Verifies individual student display
  test "should show student" do
    get student_url(@student)
    assert_response :success
  end

  # Tests edit action (Update operation setup)
  # Verifies edit form display
  test "should get edit" do
    get edit_student_url(@student)
    assert_response :success
  end

  # Tests update action (Update operation)
  # Verifies successful student information update
  test "should update student" do
    patch student_url(@student), params: { 
      student: { 
        name: "Updated Name",
        email: "updated@example.com",
        course: "Updated Course",
        student_number: "ST004"
      } 
    }
    # Verifies proper redirect after update
    assert_redirected_to student_url(@student)
  end

  # Tests destroy action (Delete operation)
  # Verifies successful student record deletion
  test "should destroy student" do
    # Verifies database record removal
    assert_difference("Student.count", -1) do
      delete student_url(@student)
    end
    # Verifies proper redirect after deletion
    assert_redirected_to students_url
  end

  # Tests search functionality
  # Verifies student search feature
  test "should search students" do
    get students_url, params: { search: @student.name }
    assert_response :success
    # Add assertions for search results if needed
  end
end
