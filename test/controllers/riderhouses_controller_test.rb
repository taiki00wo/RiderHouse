require 'test_helper'

class RiderhousesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get riderhouses_index_url
    assert_response :success
  end

  test "should get show" do
    get riderhouses_show_url
    assert_response :success
  end

  test "should get new" do
    get riderhouses_new_url
    assert_response :success
  end

  test "should get create" do
    get riderhouses_create_url
    assert_response :success
  end

  test "should get edit" do
    get riderhouses_edit_url
    assert_response :success
  end

  test "should get update" do
    get riderhouses_update_url
    assert_response :success
  end

  test "should get destroy" do
    get riderhouses_destroy_url
    assert_response :success
  end

end
