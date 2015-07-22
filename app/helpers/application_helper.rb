module ApplicationHelper
  def current_customer
    current_customer ||= Customer.find(session[:customer_id]) if session[:customer_id]
  end
end
