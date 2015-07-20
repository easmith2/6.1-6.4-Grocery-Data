class CustomersController < ApplicationController
  def new
  end

  def create
    customer = Customer.new(customer_params)
    if customer.save
      redirect_to root_path
    else
      redirect_to '/signup'
    end
  end


  private

  def customer_params
    params.require(:customer).permit(:name, :email, :password, :password_confirmation, :address, :phone)
  end
end
