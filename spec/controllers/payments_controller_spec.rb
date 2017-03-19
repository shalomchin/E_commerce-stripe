require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do

  let(:cart) { {:id=>1} }
  let(:params) { {stripeEmail: "blah@blah.com"} }
  let(:session) { {cart_id: cart.id} }

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "should create a Payment" do
      expect do
        post :create, params: params, session: session
      end.to change { Payment.count }.from(0).to(1)
    end
  end

end
