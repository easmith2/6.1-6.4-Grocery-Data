require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  def setup
    @customer = customers(:one)
    @customer2 = customers(:two)
    @item = items(:one)
    @item2  = items(:two)
    @item.update_attributes(customer_id: @customer.id)
    @item2.update_attributes(customer_id: @customer2.id)
  end

  test "GET #index if session[:customer_id] is valid" do
    session[:customer_id] = @customer.id
    get :index
    assert assigns(:items).include?(@item)
    assert_response 200
  end

  test "redirect to login if session[:customer_id] is nil" do
    session[:customer_id] = nil
    get :index
    assert_redirected_to '/signin'
  end

  test "GET #index shows only items for current customer" do
    session[:customer_id] = @customer.id
    get :index
    assert assigns(:items).include?(@item)
    refute assigns(:items).include?(@item2)
    session[:customer_id] = @customer2.id
    get :index
    refute assigns(:items).include?(@item)
    assert assigns(:items).include?(@item2)
  end
end
