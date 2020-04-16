class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
  end

  def create
    email = params[:email]
    password = params[:password]
    user = User.find_by(email: email)
    if user.authenticate(password)
      session[:current_user_id] = user.id
      redirect_to root_path
    else
      render plain: "incorrect"
    end
  end
end
