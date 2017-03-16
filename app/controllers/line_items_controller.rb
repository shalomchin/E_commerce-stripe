class LineItemsController < ApplicationController
  before_action :set_lineitems, only: [:create,:destroy,:update]

  def create
    if session[:cart_id] == nil  
      @cart = Cart.create
      session[:cart_id] = @cart.id
    else
      @cart = Cart.find(session[:cart_id])
    end
    @cart.stack_item(@product, params[:line_item][:quantity])
    redirect_to products_path, notice: "Cart updated"
  end

  def destroy
  end

  def update
  end

  private
  def set_lineitems
    @product = Product.find(params[:product_id])
  end

  def lineitems_params
      params.require(:line_item).permit(:quantity, :reservation)
  end
end
