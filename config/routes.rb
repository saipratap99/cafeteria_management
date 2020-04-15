Rails.application.routes.draw do
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :menus, :menu_items, :orders, :order_items, :users
  get "/cart", to: "orders#cart", as: "cart"
  get "/pending_orders", to: "orders#pending_orders", as: "pending_orders"
end
