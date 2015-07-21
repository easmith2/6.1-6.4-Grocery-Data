class CustomersController < ApplicationController
  def new
  end

  def create
    customer = Customer.new(customer_params)
    if customer.save
      session[:customer_id] = customer.id
      redirect_to root_path
    else
      redirect_to '/signup'
    end
  end

  def show
    @customer = current_customer
    render json: @customer
  end

  def update
    @customer = current_customer
    if @customer.update_params(customer_params)
      render json: @customer
      redirect_to root_path
    else
      render json: @customer.errors, status: 422
    end
  end

  def destroy
    @customer = current_customer
    @customer.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :password, :password_confirmation, :address, :phone)
  end

  def get_customer
    Customer.find()
  end
end
