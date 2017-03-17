# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  price       :decimal(, )
#  description :text
#  stock       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ApplicationRecord
  has_many :orders
  validates :name, presence: true, format: { with: /[a-zA-Z.]/,
    message: "only allows letters" }, uniqueness: true
  validates :price, :format => { with: /\A(\$)?(\d+)(\.|,)?\d{0,2}?\z/  ,  message: "no alphabets allowed" }
  validates :price, presence: true
  validates :description, presence: true, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }
  validates :stock, presence: true, numericality: { only_integer: true }

 def deductStock(paidStock)
  self.stock -= (paidStock) 
  self.save
 end

end
