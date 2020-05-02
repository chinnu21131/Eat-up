class SessionsController < ApplicationController
  skip_before_action :ensure_logged_in

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to "/menu"
    else
      render plain: "#{params[:password]}"
    end
  end

  def show
    render "show"
  end

  def destroy
    session[:current_user_id] = nil
    @current_user_id = nil
    redirect_to "/"
  end
end
