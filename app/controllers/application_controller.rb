class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :init_session_cart_id

  private

    def init_session_cart_id
      session[:cart_id] = Cart.find_or_create(session[:cart_id]).id
    end
end
