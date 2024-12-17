class RenameEnrollmentNumberToStudentNumber < ActiveRecord::Migration[7.1]
  def change
    rename_column :students, :enrollment_number, :student_number
  end
end
