class OrderItemsController < ApplicationController
  # created by cmd
  # rails generate controller OrderItems

  def create
    @menu_item = MenuItem.find(params[:menu_item_id])
    @order = current_user.orders.being_created ? current_user.orders.being_created : current_user.orders.create!
    @order_item = OrderItem.create!(order_id: @order.id,
                                    menu_item_id: @menu_item.id,
                                    menu_item_name: @menu_item.name,
                                    menu_item_price: @menu_item.price)
    respond_to do |format|
      if params[:cart]
        format.html { redirect_to(cart_path, notice: "#{@order_item.menu_item_name} is added to cart!") }
        format.js
      else
        format.html { redirect_to(menus_path, notice: "#{@order_item.menu_item_name} is added to cart!") }
        format.js
      end
    end
  end

  def destroy
    order_item_id = params[:id]
    @order_item = OrderItem.find(order_item_id).destroy
    respond_to do |format|
      if params[:cart]
        format.html { redirect_to(cart_path, alert: "#{@order_item.menu_item_name} is removed from cart!") }
        format.js
      else
        format.html { redirect_to(menus_path, alert: "#{@order_item.menu_item_name} is removed from cart!") }
        format.js
      end
    end
  end
end
