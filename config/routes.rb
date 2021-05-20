Rails.application.routes.draw do
  root "products#index"
  get '/products/search', to: 'products#search'
  resource :products do
    resource :comments
  end
end
