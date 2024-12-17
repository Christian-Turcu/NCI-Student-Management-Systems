require "test_helper"

class RecordTest < ActiveSupport::TestCase
  test "should not save record without title" do
    record = Record.new(date: "2024-01-01", artist: "Test Artist")
    assert_not record.save, "Saved record without a title"
  end

  test "should save valid record" do
    record = Record.new(
      title: "Test Record",
      date: "2024-01-01",
      artist: "Test Artist"
    )
    assert record.save, "Could not save valid record"
  end
end
