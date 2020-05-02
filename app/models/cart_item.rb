class CartItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :menu_item
  def self.update(id, quantity)
    cart_item = CartItem.find(id)
    cart_item.item_quantity = quantity
    cart_item.save!
  end
end
