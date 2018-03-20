require 'test_helper'

class TripsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get trips_create_url
    assert_response :success
  end

end
