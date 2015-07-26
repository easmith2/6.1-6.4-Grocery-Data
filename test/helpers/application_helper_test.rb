require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  include ApplicationHelper

  test "current_customer method returns customer associated with session[:customer_id]" do
    customer = Customer.create!(name: 'Han',
                            email: 'han@solo.com',
                            password: 'password',
                            password_confirmation: 'password'
                            )
    session[:customer_id] = customer.id
    assert_equal customer, current_customer
  end

end
