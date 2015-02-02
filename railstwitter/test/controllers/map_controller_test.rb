require 'test_helper'

class MapControllerTest < ActionController::TestCase

  test "should get google" do
    get :google
    assert_response :success
  end

end
