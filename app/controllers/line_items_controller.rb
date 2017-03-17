class LineItemsController < ApplicationController
  before_action :set_product, only: [:create]

  def create
    if session[:cart_id] == nil  
      @cart = Cart.new
      session[:cart_id] = @cart.id
    else
      @cart = Cart.find(session[:cart_id])
    end
    @cart.stack_item(@product, params[:line_item][:quantity], params[:line_item][:reservation])
    redirect_to products_path, notice: "Cart updated"
  end

  def destroy
    @line_item = LineItem.find(params[:id])
          
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_url(session[:cart_id]), notice: 'Product was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def update
  end

  private
  def set_product
    @product = Product.find(params[:product_id])
  end

  def lineitems_params
      params.require(:line_item).permit(:quantity, :reservation)
  end

end
