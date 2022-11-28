require "test_helper"

class LicencesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get licences_index_url
    assert_response :success
  end

  test "should get show" do
    get licences_show_url
    assert_response :success
  end

  test "should get new" do
    get licences_new_url
    assert_response :success
  end

  test "should get create" do
    get licences_create_url
    assert_response :success
  end

  test "should get edit" do
    get licences_edit_url
    assert_response :success
  end

  test "should get update" do
    get licences_update_url
    assert_response :success
  end
end
