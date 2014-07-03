require 'test_helper'

class SubscriptionControllerTest < ActionController::TestCase
  test "should get success" do
    get :success
    assert_response :success
  end

end
