require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get land" do
    get :land
    assert_response :success
  end

end
