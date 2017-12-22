class OrdersController < ApplicationController
  def show
    @order = Order.find_by(user_id: current_user.id)
  end
end
