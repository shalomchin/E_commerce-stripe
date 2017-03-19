require 'rails_helper'

RSpec.describe CartsController, type: :controller do

  let(:cart) { create(:cart) }

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: cart.id }
      expect(response).to have_http_status(:success)
    end
  end

end
