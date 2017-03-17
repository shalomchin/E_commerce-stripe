class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
  validates :reservation, presence: true
  

  def subtotal
    self.product.price * self.quantity
  end

  def lineitemDeduct
    puts self.quantity
    puts self.product.name
    self.product.deductStock(self.quantity)
  end  
end

