require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_response :unprocessable_entity
    assert_template 'users/new'
    assert_select 'div#error_explanation'     # 1. id="error_explanationが存在するか
    assert_select 'div.alert'                            # 2.1. class="alert"が存在するか
    assert_select 'div.alert-danger'              # 2.2. class="alert-danger"が存在するか
  end

  test "valid signup information" do
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Example User",
                                         email: "user@example.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'users/show'
    #assert is_logged_in?
    assert_not flash.empty?
  end

end

