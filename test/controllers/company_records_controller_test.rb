require "test_helper"

class CompanyRecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get company_records_index_url
    assert_response :success
  end

  test "should get show" do
    get company_records_show_url
    assert_response :success
  end

  test "should get create" do
    get company_records_create_url
    assert_response :success
  end

  test "should get new" do
    get company_records_new_url
    assert_response :success
  end

  test "should get edit" do
    get company_records_edit_url
    assert_response :success
  end

  test "should get update" do
    get company_records_update_url
    assert_response :success
  end

  test "should get destory" do
    get company_records_destory_url
    assert_response :success
  end
end
