# Student model class that implements core business logic 
# Active Record pattern in Rails framework and Data validation implementation 
class Student < ApplicationRecord
  # Ensures student name is not empty
  validates :name, presence: true
  
  # This ensures no duplicate student numbers in the system
  validates :student_number, presence: true, uniqueness: true
  
  # Email validation using regex pattern for data integrity
  # Uses built-in URI::MailTo::EMAIL_REGEXP for standard email format
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  
  # Required for student record management
  validates :course, presence: true

  # Scope for search
  scope :search_by_name, ->(query) { where("name LIKE ?", "%#{query}%") }
end
