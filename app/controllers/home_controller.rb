class HomeController < ApplicationController
  skip_before_action :ensure_logged_in

  def index
    if current_user
      redirect_to "/menu"
    else
      render "index"
    end
  end
end

#, locals: { user_email: current_user.email }
