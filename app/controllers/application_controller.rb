class ApplicationController < ActionController::Base
  before_action :ensure_user_logged_in

  def ensure_user_logged_in
    unless current_user
      redirect_to(root_path, alert: "Please login before continuing")
    end
  end

  def ensure_owner_logged_in
    unless current_user.is_owner?
      redirect_to(menus_path, alert: "Your'e not allowed to access the page")
    end
  end

  def ensure_clerk_logged_in
    unless current_user.is_clerk?
      redirect_to(menus_path, alert: "Your'e not allowed to access the page")
    end
  end

  def ensure_owner_or_clerk_logged_in
    unless current_user.is_clerk? || current_user.is_owner?
      redirect_to(menus_path, alert: "Your'e not allowed to access the page")
    end
  end

  def current_user
    return @current_user if @current_user

    current_user_id = session[:current_user_id]
    if current_user_id
      @current_user = User.find(current_user_id)
    else
      nil
    end
  end

  def password(password)
    if password.length > 3
      []
    else
      ["Password must be atleat 4 charecters!"]
    end
  end
end
