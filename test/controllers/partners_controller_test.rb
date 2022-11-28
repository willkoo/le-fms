require "test_helper"

class PartnersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get partners_index_url
    assert_response :success
  end

  test "should get show" do
    get partners_show_url
    assert_response :success
  end

  test "should get create" do
    get partners_create_url
    assert_response :success
  end

  test "should get new" do
    get partners_new_url
    assert_response :success
  end

  test "should get edit" do
    get partners_edit_url
    assert_response :success
  end

  test "should get update" do
    get partners_update_url
    assert_response :success
  end
end
