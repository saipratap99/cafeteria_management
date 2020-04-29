class SearchController < ApplicationController
  def search
    if params[:order_id]
      order = Order.get_order_by_id(params[:order_id])
      if order
        redirect_to("/orders/all##{order.id}")
      else
        redirect_to(all_orders_path, alert: "Order not found")
      end
    elsif params[:email]
      user = User.get_user_by_email(params[:email])
      if user
        redirect_to("/users##{user.id}")
      else
        redirect_to(users_path, alert: "User not found")
      end
    elsif params[:menu_item]
    end
  end
end
