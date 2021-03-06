class Cart < ApplicationRecord
  has_one :payment
  has_many :line_items
  has_many :products, through: :line_items

  def total_price
    total_price = 0
    self.line_items.each do |qty|
      total_price += qty.subtotal
    end
    total_price
  end

  # def update_inventory
  #   self.line_items.each do |item|
  #     item.product.slot -= item.quantity
  #     item.product.save
  #   end
  # end

  def stack_item(product, quantity, reservation)
    self.add_item(product, quantity, reservation)
  end

  def increase_quantity(product, quantity)
    line_item = self.line_items.find_by(product: product)
    line_item.quantity = quantity
    line_item.save!
  end

  def add_item(product, quantity, reservation)
    self.line_items.create!(product: product, quantity: quantity, reservation: reservation)
  end

  # def item_already_exists?(product)
  #   self.line_items.find_by(product: product).present?
  # end

  def self.find_or_create(cart_id)
    if cart_id == nil
      cart = Cart.create
    else
      cart = Cart.find(cart_id)
    end
  end 
end  
