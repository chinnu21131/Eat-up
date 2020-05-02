class CartItemsController < ApplicationController
  def create
    new_cart_item = CartItem.create!(user_id: current_user.id,
                                     menu_item_id: params[:menu_item_id],
                                     cart_item: params[:menu_item],
                                     cart_item_price: params[:price],
                                     item_quantity: 1)

    redirect_to "/menu"
  end

  def index
    @cart_item = CartItem.where(user_id: current_user.id)
  end

  def update
    cart_item = CartItem.find(params[:id])
    if params[:state]
      cart_item.item_quantity += 1
      cart_item.save!
    else
      cart_item.item_quantity -= 1
      cart_item.save!
      if cart_item.item_quantity == 0
        CartItem.find(params[:id]).destroy
      end
    end
    redirect_to "/menu"
  end

  def destroy
    CartItem.find(params[:id]).destroy
    redirect_to cart_items_path
  end
end
