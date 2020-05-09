class OrderItemsController < ApplicationController
  # created by cmd
  # rails generate controller OrderItems

  def create
    menu_item = MenuItem.find(params[:menu_item_id])
    order = current_user.orders.being_created ? current_user.orders.being_created : current_user.orders.create!
    order_item = OrderItem.create!(order_id: order.id,
                                   menu_item_id: menu_item.id,
                                   menu_item_name: menu_item.name,
                                   menu_item_price: menu_item.price)
    if params[:cart]
      redirect_to(cart_path, notice: "#{order_item.menu_item_name} is added to cart!")
    else
      redirect_to(menus_path, notice: "#{order_item.menu_item_name} is added to cart!")
    end
  end

  def destroy
    order_item_id = params[:id]
    order_item = OrderItem.find(order_item_id).destroy
    if params[:cart]
      redirect_to(cart_path, alert: "#{order_item.menu_item_name} is removed from cart!")
    else
      redirect_to(menus_path, alert: "#{order_item.menu_item_name} is removed from cart!")
    end
  end
end
