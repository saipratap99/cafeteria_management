class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    if current_user
      redirect_to(menus_path, notice: "Your'e already signed in user")
    end
  end

  def create
    email = params[:email]
    password = params[:password]
    user = User.find_by(email: email)
    if user && user.authenticate(password)
      session[:current_user_id] = user.id
      redirect_to(menus_path, notice: "Your'e signed in successfully!")
    else
      redirect_to(new_session_path, alert: "Invalid email or password!")
    end
  end

  def destroy
    session[:current_user_id] = nil
    @current_user = nil
    redirect_to(root_path, notice: "Your'e logged Out successfully!")
  end
end
