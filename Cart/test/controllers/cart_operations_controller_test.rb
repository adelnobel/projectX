require 'test_helper'

class CartOperationsControllerTest < ActionController::TestCase
  test "should get add_tem" do
    get :add_tem
    assert_response :success
  end

  test "should get remove_item" do
    get :remove_item
    assert_response :success
  end

  test "should get update_item" do
    get :update_item
    assert_response :success
  end

  test "should get get_cart" do
    get :get_cart
    assert_response :success
  end

end
