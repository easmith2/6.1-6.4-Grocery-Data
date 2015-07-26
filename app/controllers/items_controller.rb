class ItemsController < ApplicationController
  def index
    if current_customer
      get_customer_items
      @page_index = 0
      @page_displayed = 1
    else
      redirect_to '/signin'
    end
  end

  def get_customer_items
    @items = Item.for_customer(current_customer).order('name')
    @show_per_page = 25
    @page_total = (@items.length / @show_per_page).ceil
  end

  def items_paginated
    get_customer_items
    @page_displayed = params[:page_number].to_i
    @page_displayed == 0 ? @page_index = 0 : @page_index = (@page_displayed - 1)
    @items = Item.for_customer(current_customer).limit(@show_per_page).offset(@show_per_page  * (@page_displayed - 1))
    respond_to do |format|
      format.html { render template: 'items/index' }
      format.json { render json: @items }
    end
  end

end
