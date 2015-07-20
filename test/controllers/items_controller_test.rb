require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  def setup
    @customer = customers(:one)
    @item = items(:one)
    @item.update_attributes(customer_id: @customer.id)
  end

  test "GET #index" do
    get :index
    assert assigns(:items).include?(@item)
    assert_response 200
  end
end
