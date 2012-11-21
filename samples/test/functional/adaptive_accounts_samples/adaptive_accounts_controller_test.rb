require 'test_helper'

module AdaptiveAccountsSamples
  class AdaptiveAccountsControllerTest < ActionController::TestCase
    test "should get create account form" do
      get :create_account
      assert_response :success
    end

  end
end
