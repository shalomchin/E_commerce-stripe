class Payment < ApplicationRecord
  belongs_to :cart

  def stripePayment(cart, email, token)
    
      # Amount in cents
    @amount = cart.total_price*100
    customer = Stripe::Customer.create(
      :email => email,
      :source  => token
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount.round(),
      :description => 'Pick a Date bro',
      :currency    => 'sgd'
    )

    rescue Stripe::CardError => e
      flash[:error] = e.message
      puts "Transaction Fail"
    
  end

  def deductAllStock
    self.cart.line_items.each do |line_item|
      line_item.lineitemDeduct
    end  
  end  
end

