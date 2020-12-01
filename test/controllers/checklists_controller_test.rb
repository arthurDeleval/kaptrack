require 'test_helper'

class ChecklistsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get checklists_index_url
    assert_response :success
  end

  test "should get show" do
    get checklists_show_url
    assert_response :success
  end

  test "should get new" do
    get checklists_new_url
    assert_response :success
  end

  test "should get create" do
    get checklists_create_url
    assert_response :success
  end

  test "should get edit" do
    get checklists_edit_url
    assert_response :success
  end

  test "should get update" do
    get checklists_update_url
    assert_response :success
  end

  test "should get destroy" do
    get checklists_destroy_url
    assert_response :success
  end

end
