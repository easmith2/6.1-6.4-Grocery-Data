require 'test_helper'

# Add at runtime an action to ApplicationController
ApplicationController.class_eval do
  def any_action
    render nothing: true
  end
end

# If disable_clear_and_finalize is set to true, Rails will not clear other routes
# when calling again the draw method. Look at the source code at:
# http://apidock.com/rails/v4.0.2/ActionDispatch/Routing/RouteSet/draw
Rails.application.routes.disable_clear_and_finalize = true

# Create a new route for the new action
Rails.application.routes.draw do
  get 'any_action' => 'application#any_action'
end

# Test
class ApplicationControllerTest < ActionController::TestCase
  # test "current_customer method returns customer associated with session[:customer_id]" do
  #   customer = customers(:one)
  #   get :any_action
  #   session[:customer_id] = customer.id
  #   result = assigns(current_customer)
  #   assert_equal customer, result
  # end
end
