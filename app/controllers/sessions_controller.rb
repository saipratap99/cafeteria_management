class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:email]
    password = params[:password]
    user = User.find_by(email: email)
    if user.authenticate(password)
      redirect_to root_path
    else
      render plain: "incorrect"
    end
  end
end
