require "test_helper"

class QuizOptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get quiz_options_index_url
    assert_response :success
  end

  test "should get show" do
    get quiz_options_show_url
    assert_response :success
  end

  test "should get create" do
    get quiz_options_create_url
    assert_response :success
  end

  test "should get new" do
    get quiz_options_new_url
    assert_response :success
  end
end
