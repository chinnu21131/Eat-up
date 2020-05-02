class User < ActiveRecord::Base
  has_secure_password
  has_many :cart_items
  has_many :orders
end
