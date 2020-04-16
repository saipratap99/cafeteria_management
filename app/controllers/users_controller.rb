class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    if current_user
      flash[:notice] = "Your'e already signed up user"
      redirect_to menus_path
    end
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    password_confirmation = params[:password_confirmation]

    user = User.new(name: name, email: email, role: "customer", password: password, password_confirmation: password_confirmation)
    if user.password_confirmation
      user.save!
      flash[:notice] = "Welcome #{user.name}!"
      session[:current_user_id] = user.id
      redirect_to menus_path
    else
      flash[:alert] = "Password doesn't match"
      redirect_to new_user_path
    end
  end
end
