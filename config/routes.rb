Rails.application.routes.draw do
  resources :inventory_files
  resources :inventories, only: [:index, :show]
end
