require "test_helper"

class StaticControllerTest < ActionDispatch::IntegrationTest
  test "should get landing_page" do
    get static_landing_page_url
    assert_response :success
  end

  test "unauthenticated user should not get dashboard" do
    get static_dashboard_url
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "authenticated github user should get dashboard" do
    login_with_github
    post user_github_omniauth_callback_path
    get static_dashboard_url
    assert_response :success
  end

  test "authenticated microsoft user should get dashboard" do
    login_with_microsoft
    post user_azure_activedirectory_v2_omniauth_callback_path
    get static_dashboard_url
    assert_response :success
  end
end
