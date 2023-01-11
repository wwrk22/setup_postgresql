Rails.application.routes.draw do
  resources :to_do_items
  resources :to_do_lists
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/to_do_lists/by_name/:name', to: 'to_do_lists#index_like'
end
