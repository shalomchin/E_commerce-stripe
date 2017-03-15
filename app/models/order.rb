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
end
