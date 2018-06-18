require 'test_helper'

class CanopenerControllerTest < ActionController::TestCase
  test "should get open_games" do
    get :open_games
    assert_response :success
  end

end
