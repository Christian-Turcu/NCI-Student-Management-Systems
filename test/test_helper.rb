# Test Helper Configuration (LO3: Test-Driven Development)
# Sets up the testing environment and common test functionality

# Configure Rails environment for testing
ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

# Controller Test Configuration
# Includes authentication helpers if Devise is used
module ActionController
  class TestCase
    # Include Devise test helpers for authentication testing
    include Devise::Test::IntegrationHelpers if defined?(Devise)
  end
end

# Base Test Class Configuration
# Provides common functionality for all tests
class ActiveSupport::TestCase
  # Enable parallel test execution for faster test runs
  # Uses multiple processors to distribute test load
  parallelize(workers: :number_of_processors)

  # Load all fixture files
  # Fixtures provide sample data for testing
  fixtures :all

  # Helper Methods Section
  # Add custom helper methods below for use in tests
  
  # Example helper method for student validation
  def valid_student_attributes
    {
      name: "Test Student",
      email: "test@example.com",
      student_number: "ST#{Time.now.to_i}",
      course: "Test Course"
    }
  end
end

# Integration Test Configuration
# Setup for end-to-end testing scenarios
class ActionDispatch::IntegrationTest
  # Include authentication helpers for integration tests
  include Devise::Test::IntegrationHelpers if defined?(Devise)
  
  # Handle CSRF token for secure requests
  def sign_in_as(user)
    post sign_in_path, params: { 
      session: { email: user.email, password: 'password' } 
    }
  end
end
