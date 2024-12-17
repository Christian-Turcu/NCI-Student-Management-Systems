class Student < ApplicationRecord
  validates :name, presence: true
  validates :student_number, presence: true, uniqueness: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :course, presence: true
end
