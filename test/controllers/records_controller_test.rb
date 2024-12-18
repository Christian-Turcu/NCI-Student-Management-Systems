require "test_helper"

class RecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @record = records(:one)
    Rails.application.config.action_controller.allow_forgery_protection = false
  end

  teardown do
    Rails.application.config.action_controller.allow_forgery_protection = true
  end

  test "should get index" do
    get records_url
    assert_response :success
  end

  test "should get new" do
    get new_record_url
    assert_response :success
  end

  test "should create record" do
    assert_difference("Record.count") do
      post records_url, params: { 
        record: { 
          title: "Test Record",
          description: "Test Description",
          status: "active",
          date: "2024-01-03",
          artist: "Test Artist"
        } 
      }
    end

    assert_redirected_to record_url(Record.last)
  end

  test "should show record" do
    get record_url(@record)
    assert_response :success
  end

  test "should get edit" do
    get edit_record_url(@record)
    assert_response :success
  end

  test "should update record" do
    patch record_url(@record), params: { 
      record: { 
        title: "Updated Title",
        description: "Updated Description",
        status: "completed",
        date: "2024-01-04",
        artist: "Updated Artist"
      } 
    }
    assert_redirected_to record_url(@record)
    @record.reload
    assert_equal "Updated Title", @record.title
    assert_equal "Updated Artist", @record.artist
  end

  test "should destroy record" do
    assert_difference("Record.count", -1) do
      delete record_url(@record)
    end

    assert_redirected_to records_url
  end
end
