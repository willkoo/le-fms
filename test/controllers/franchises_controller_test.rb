require "test_helper"

class FranchisesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get franchises_index_url
    assert_response :success
  end

  test "should get show" do
    get franchises_show_url
    assert_response :success
  end

  test "should get new" do
    get franchises_new_url
    assert_response :success
  end

  test "should get create" do
    get franchises_create_url
    assert_response :success
  end

  test "should get edit" do
    get franchises_edit_url
    assert_response :success
  end

  test "should get update" do
    get franchises_update_url
    assert_response :success
  end

  test "should get destroy" do
    get franchises_destroy_url
    assert_response :success
  end
end
