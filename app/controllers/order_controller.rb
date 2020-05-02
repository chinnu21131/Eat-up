class OrderController < ApplicationController
  def create
    new_order = Order.create!(user_id: current_user.id,
                              order_date: Date.today,
                              amount: params[:amount])
    OrderItem.active_order_items(new_order.id)
    redirect_to "/order"
  end

  def show
    @order = Order.find(params[:id])
  end
end
