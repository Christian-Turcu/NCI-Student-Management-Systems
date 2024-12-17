class CreateStudents < ActiveRecord::Migration[8.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :enrollment_number
      t.string :course

      t.timestamps
    end
  end
end
