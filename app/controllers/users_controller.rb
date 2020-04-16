class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    password_confirmation = params[:password_confirmation]

    user = User.new(name: name, email: email, role: "customer", password: password, password_confirmation: password_confirmation)
    if user.password_confirmation
      user.save!
      redirect_to root_path
    else
      redirect_to new_user_path
    end
  end
end
