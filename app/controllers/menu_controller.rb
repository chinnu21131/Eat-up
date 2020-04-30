class MenuController < ApplicationController
  def index
  end

  def create
    new_menu = Menu.create!(menu_name: params[:menu_name])
    redirect_to "/menu/new"
  end
end
