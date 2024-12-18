# Student model class that implements core business logic (LO1: Framework Implementation)
# This model demonstrates Active Record pattern in Rails framework
class Student < ApplicationRecord
  # Data validation implementation (LO1: Design Patterns)
  # Ensures student name is not empty
  validates :name, presence: true
  
  # Implements unique constraint for student identification
  # This ensures no duplicate student numbers in the system
  validates :student_number, presence: true, uniqueness: true
  
  # Email validation using regex pattern for data integrity
  # Uses built-in URI::MailTo::EMAIL_REGEXP for standard email format
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  
  # Course validation to maintain data consistency
  # Required for student record management
  validates :course, presence: true

  # Scope for search functionality (part of CRUD implementation)
  scope :search_by_name, ->(query) { where("name LIKE ?", "%#{query}%") }
end
