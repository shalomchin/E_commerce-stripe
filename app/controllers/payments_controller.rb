class PaymentsController < 
   def new
    @cart = Cart.find(session[:cart_id])
    @payment = Payment.new
  end

  def create
    @cart = Cart.find(session[:cart_id])
    @payment = @cart.build_payment(payment_params)
    @payment.transaction(params[:stripeToken])
    flash[:success] = "THANKS FOR PAYING"
    redirect_to products_path
  end

private
  def payment_params
    params.require(:payment).permit(:address, :contact, :email)
  end
end
