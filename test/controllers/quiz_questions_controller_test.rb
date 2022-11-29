require "test_helper"

class QuizQuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get quiz_questions_index_url
    assert_response :success
  end

  test "should get show" do
    get quiz_questions_show_url
    assert_response :success
  end

  test "should get new" do
    get quiz_questions_new_url
    assert_response :success
  end

  test "should get create" do
    get quiz_questions_create_url
    assert_response :success
  end
end
