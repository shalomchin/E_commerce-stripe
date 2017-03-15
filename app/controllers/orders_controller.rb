class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @product = Product.find(params[:product_id])
    @orders = @product.orders.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    
  end

  # GET /orders/new
  def new
    
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create

    @order = Order.new(order_params)


    # I don't understand this
    @product = Product.find(params[:product_id])

    @order.product_id = @product.id
      # Amount in cents
    @amount = @product.price * 100

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount.round(),
      :description => 'Pick a Date bro',
      :currency    => 'sgd'
    )

    if @order.save!
      
      @product.stock -= 1
      @product.save
      
      redirect_to product_path(@product.id), notice: "Thanks for supporting the lovely ladies. Your payment is confirmed! You will recieve an email of your reciept."
    end
    
    # respond_to do |format|
    #   if @order.save!
        
    #     @product.stock -= 1
    #     @product.save
    #     format.html { redirect_to product_path(@product.id), notice: 'Order was successfully created.' }
    #     format.json { render :show, status: :created, location: @order }        
    #   else
    #     format.html { render :new }
    #     format.json { render json: @order.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:product_id, :reservation)
    end
end

