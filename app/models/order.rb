# == Schema Information
#
# Table name: orders
#
#  id          :integer          not null, primary key
#  reservation :string
#  product_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Order < ApplicationRecord
  belongs_to :product

   def stripePayment(product, email, token)
    # self.product_id = @product.id
      # Amount in cents
    @amount = product.price * 100

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
  

  end

end
