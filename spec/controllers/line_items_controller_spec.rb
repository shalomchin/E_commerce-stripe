require 'rails_helper'

RSpec.describe LineItemsController, type: :controller do
  let(:params) do
    {
      product_id: product.id,
      line_item: {
        quantity: 4,
        reservation: "Anytime"
      }
    }
  end

  describe "GET #create" do
    let(:product) { create(:product) }
    let(:cart) { create(:cart) }
    let(:params) do
      {
        product_id: product.id,
        line_item: {
          quantity: 4,
          reservation: "Anytime"
        }
      }
    end
  end

  # failed
  let(:session) { {cart_id: cart.id} }
  it "should redirect to product_path/id" do
    post :create, params: params, session: {
      cart_id: cart.id
    }
    should redirect_to products_path(params)
  end

  it "should create a LineItem" do
    expect do
      post :create, params: params, session: {
        cart_id: cart.id
      }
    end.to change { LineItem.count }.from(0).to(1)
  end

end
