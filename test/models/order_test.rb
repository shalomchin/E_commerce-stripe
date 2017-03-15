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

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
