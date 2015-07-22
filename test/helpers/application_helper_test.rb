require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  include ApplicationHelper

  test "current_customer method returns customer associated with session[:customer_id]" do
    customer = customers(:one)
    session[:customer_id] = customer.id
    binding.pry
    result = assigns(current_customer)
    assert_equal customer, result
  end

end
