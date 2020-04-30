class MenuItemsController < ApplicationController
  def new
  end

  def create
    new_menu_item = params[:menu_item]
    price = params[:price]
    menu_id = params[:menu_id]
    MenuItem.create!(menu_item: new_menu_item, description: nil, price: price, menu_id: menu_id)
    redirect_to "/menu/new"
  end

  def create1
    id = params[:menu_no]
    MenuItem.no = id
    redirect_to "/menu_items/new"
  end
end
