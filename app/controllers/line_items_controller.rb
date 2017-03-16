class LineItemsController < ApplicationController
  before_action :set_lineitems, only: [:create,:destroy,:update]

  def create
    @cart = Cart.find_or_create(session[:cart_id], current_user)
    session[:cart_id] = @cart.id

    @cart.stack_item(@product, params)
    redirect_to @product
  end

  def destroy
  end

  def update
  end

  private
  def set_lineitems
    @dating_package = Product.find(params[:product_id])
  end
end
