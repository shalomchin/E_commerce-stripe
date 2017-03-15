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

require 'rails_helper'

RSpec.describe Product, :type => :model do
  subject { Product.new(name: "Anything", description: "Anything", 
    price: "123.23", stock: 12) 
}

it "is not valid with empty attributes" do 

 expect(Product.new).to_not be_valid
end

it "is not valid without a name" do
  subject.name = nil
  expect(subject).to_not be_valid
end

it "is not valid without a price" do
  subject.price = nil
    # product = Product.new(price: nil)
    expect(subject).to_not be_valid
  end

  it "is not valid without a description" do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a stock" do
    subject.stock = nil
    expect(subject).to_not be_valid
  end

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

end

RSpec.describe Product, type: :model do
  it { should validate_numericality_of(:stock) }
end

RSpec.describe Product, type: :model do
  it { should validate_uniqueness_of(:name) }
end

RSpec.describe Product, :type => :model do
  describe "Associations" do
    it { should have_many(:orders) }
  end
end
