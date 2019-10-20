require 'test_helper'

class AboutControllerTest < ActionDispatch::IntegrationTest
  test "should get invention" do
    get about_invention_url
    assert_response :success
  end

end
