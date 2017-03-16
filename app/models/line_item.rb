class LineItem < ApplicationRecord
  belongs_to :product_id
  belongs_to :cart_id
end
