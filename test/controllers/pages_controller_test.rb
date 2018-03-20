require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get preferences" do
    get pages_preferences_url
    assert_response :success
  end

end
