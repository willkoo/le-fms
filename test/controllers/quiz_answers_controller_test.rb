require "test_helper"

class QuizAnswersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get quiz_answers_index_url
    assert_response :success
  end

  test "should get show" do
    get quiz_answers_show_url
    assert_response :success
  end

  test "should get create" do
    get quiz_answers_create_url
    assert_response :success
  end

  test "should get new" do
    get quiz_answers_new_url
    assert_response :success
  end
end
