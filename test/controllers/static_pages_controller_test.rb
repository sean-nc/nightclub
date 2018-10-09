require 'test_helper'
require 'minitest/autorun'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home as root url" do
    get root_url
    assert_response :success
  end

  test "should get about" do
    get about_url
    assert_response :success
  end


  test "should get contact" do
    get contact_url
    assert_response :success
  end
end
