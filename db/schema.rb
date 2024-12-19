ActiveRecord::Schema[8.0].define(version: 2024_12_17_115134) do
  create_table "records", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.string "artist"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "student_number"
    t.string "course"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
