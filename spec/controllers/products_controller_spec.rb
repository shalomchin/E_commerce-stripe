require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  let(:valid_attributes) {
    ({ name: "Anything", description: "Anything",
       price: "123.23", stock: 12 })
  }

  let(:invalid_attributes) {
    Product.create( name: "2Anything", description: nil,
                    price: "ab123.23", stock: "twelve" )
  }

  let(:valid_session) { {} }

  describe ProductsController do
    # let(:product) {Product.all}

    describe "GET index" do
      it 'assigns all product to @products' do
        product = Product.create! valid_attributes
        get :index
        expect(assigns[:products]).to match_array(Product.all)
      end

    end


    # describe "GET #index" do
    #   it "assigns all products as @products" do
    #     product = Product.create! valid_attributes
    #     get :index, params: {}, session: valid_session
    #     expect(assigns(:products)).to eq([product])
    #   end
    # end


    describe "GET #show" do
      it "assigns the requested product as @product" do
        product = Product.create! valid_attributes
        get :show, params: {id: product.id}, session: valid_session
        expect(assigns(:product)).to eq(Product.find(product.id))
      end
    end

    describe "GET #new" do
      it "only signed-in users can assign a new product as @product" do
        get :new, session: valid_session
        expect(response).to have_http_status(:redirect)
        
      end

    describe "GET root" do
    it "routes to products#index" do
      expect(get: "/").to route_to(controller: "products", action: "index")
      end
    end 

    end

    #   describe "GET #index" do
    #     it "populates an array of atrributes"
    #     it "renders the :index view"
    #   end

    #   describe "GET #show" do
    #     it "assigns the requested contact to @contact"
    #     it "renders the :show template"
    #   end

    #   describe "GET #new" do
    #     it "assigns a new Contact to @contact"
    #     it "renders the :new template"
    #   end

    #   describe "POST #create" do
    #     context "with valid attributes" do
    #       it "saves the new contact in the database"
    #       it "redirects to the home page"
    #     end

    #     context "with invalid attributes" do
    #       it "does not save the new contact in the database"
    #       it "re-renders the :new template"
    #     end

    #     it "redirects to the home page upon save" do
    #       let (:a) { Product.create( name: "Anything", description: "Anything",
    #     price: "123.23", stock: 12 )}
    #   post :create, contact: a.attributes_for(:contact)
    #   response.should redirect_to root_url
    # end

  end
end
