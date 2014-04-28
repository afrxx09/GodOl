require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get start" do
    get :start
    assert_response :success
  end

  test "should get kontakt" do
    get :kontakt
    assert_response :success
  end

end
