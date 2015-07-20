class ItemsController < ApplicationController
  def index
    if current_customer
      @items = Item.for_customer(current_customer)
    else
      redirect_to '/signin'
    end
  end
end
