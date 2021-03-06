class LineItemsController < ApplicationController
  def create
    if current_user.current_cart.nil?
      current_user.current_cart = Cart.create(user_id: current_user.id)
      current_user.save
    end
    current_user.current_cart.add_item(params[:item_id])
    current_user.current_cart.save
    redirect_to cart_path(current_user.current_cart)
  end
end
