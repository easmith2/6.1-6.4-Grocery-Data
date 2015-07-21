require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  def setup
    @customer = customers(:one)
    @item = items(:one)
    @item.update_attributes(customer_id: @customer.id)
  end

  test "create customer if params are valid" do
    assert_difference('Customer.count', 1) do
      post :create, customer: { name: 'Han',
                                email: 'han@solo.com',
                                password: 'password',
                                password_confirmation: 'password'
                              }
    end
    assert_redirected_to root_path
  end

  test "do not create customer if params are invalid" do
    assert_no_difference('Customer.count') do
      post :create, customer: { name: '',
                                email: 'han@solo.com',
                                password: 'password',
                                password_confirmation: 'password'
                              }
    end
    assert_redirected_to '/signup'
  end

  test "session[:customer_id] is assigned when new customer is created" do
    customer = Customer.new(name: 'Han',
                            email: 'han@solo.com',
                            password: 'password',
                            password_confirmation: 'password'
                            )
    customer.save
    assert session[:customer_id] = customer.id
  end

  test "GET #show" do
    get :show, id: @customer.id
    assert_response :success
  end
end
