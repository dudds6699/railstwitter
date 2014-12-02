require 'test_helper'

class MapControllerTest < ActionController::TestCase
  test "should get d3" do
    get :d3
    assert_response :success
  end

  test "should get google" do
    get :google
    assert_response :success
  end

end
