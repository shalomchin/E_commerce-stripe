class PaymentsController < ApplicationController
  def new
    @cart = Cart.find(session[:cart_id])
    @payment = Payment.new
  end

  def create
    @cart = Cart.find(session[:cart_id])
    @payment = Payment.new(payment_params)
    @payment.cart_id = @cart.id

    @payment.stripePayment(@cart, params[:stripeEmail], params[:stripeToken])
    
    if @payment.save!
      session[:cart_id] = nil
      # @product.stock -= 1
      # @product.save
      
      redirect_to products_path, notice: "Thanks for supporting the lovely ladies. Your payment is confirmed! You will recieve an email of your reciept."
    else
      redirect_to products_path, notice: "Your order did not go through."
    end

  end

private
  def payment_params
    params.require(:payment).permit(:address, :contact, :email)
  end
end
