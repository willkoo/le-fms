require "test_helper"

class QuizAttemptsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get quiz_attempts_index_url
    assert_response :success
  end

  test "should get show" do
    get quiz_attempts_show_url
    assert_response :success
  end

  test "should get new" do
    get quiz_attempts_new_url
    assert_response :success
  end

  test "should get create" do
    get quiz_attempts_create_url
    assert_response :success
  end
end
