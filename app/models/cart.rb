class Cart < ApplicationRecord
  has_one :payment
  has_many :line_items
  has_many :products, through: :line_items
end
