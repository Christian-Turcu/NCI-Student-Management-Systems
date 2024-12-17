class AddFieldsToRecords < ActiveRecord::Migration[8.0]
  def change
    add_column :records, :date, :date
    add_column :records, :artist, :string
  end
end
