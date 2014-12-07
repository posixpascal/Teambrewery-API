require 'test_helper'

class Api::TypeControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get find" do
    get :find
    assert_response :success
  end

end
