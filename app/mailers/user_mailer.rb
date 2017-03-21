class UserMailer < ApplicationMailer
  default from: 'rubyonrails.practical@gmail.com'

  def notify_bestseller(user)
    @user = user
    @url  = 'http://www.pickyedate.com/'
    

    payments = Payment.all

    product_name = []
    product_quantity = []
    product_hash = {}
    payments.each do |payment|
      # // loops through the line items
      payment.cart.line_items.each do |line_item|
        product_name << line_item.product.name
        product_quantity << line_item.quantity
      end
    end

    top_product_hash = product_name.zip(product_quantity)
    .each_with_object(Hash.new(0)) {|(k, v), h| h[k] += v }

    #To combine the 2 arrays in a hash.
    #   product_name.zip(product_quantity)
    # .group_by(&:first)
    # .map { |k, v| [k, v.map(&:last).inject(:+)] }
    # .to_h
    # e.g.
    #=> { "Pomegranate" => 2, "Raspberry" => 9, "Miracle fruit" => 5}

    @top_products = top_product_hash.sort_by { |k,v| -v }.first(3).to_h.keys
    mail(to: @user.email, subject: 'Check out our top 3 ladies')
  end
end
