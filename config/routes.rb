Rails.application.routes.draw do
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :menus, :menu_items, :orders, :order_items
  get "/cart", to: "orders#cart"
end
