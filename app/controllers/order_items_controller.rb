class OrderItemsController < ApplicationController
  def create
    new_order_item = OrderItem.create!(menu_item_id: params[:menu_item_id],
                                       order_id: params[:order_id],
                                       menu_item_name: params[:menu_item],
                                       quantity: params[:quantity])
    redirect_to "/menu"
  end
end
