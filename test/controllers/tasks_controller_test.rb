require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get tasks_edit_url
    assert_response :success
  end

  test "should get update" do
    get tasks_update_url
    assert_response :success
  end

end
