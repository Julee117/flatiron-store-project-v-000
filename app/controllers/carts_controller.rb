class CartsController < ApplicationController
  def show
    @current_cart = Cart.find_by(user_id: current_user.id)
  end

  def checkout
    @current_cart = Cart.find_by(user_id: current_user.id)
    @current_cart.change_inventory
    @current_cart.destroy
    redirect_to cart_path(@current_cart)
  end
end
