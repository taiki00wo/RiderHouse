require 'test_helper'

class RiderhouseControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get riderhouse_index_url
    assert_response :success
  end

  test "should get show" do
    get riderhouse_show_url
    assert_response :success
  end

  test "should get new" do
    get riderhouse_new_url
    assert_response :success
  end

  test "should get create" do
    get riderhouse_create_url
    assert_response :success
  end

  test "should get edit" do
    get riderhouse_edit_url
    assert_response :success
  end

  test "should get update" do
    get riderhouse_update_url
    assert_response :success
  end

  test "should get destroy" do
    get riderhouse_destroy_url
    assert_response :success
  end

end
