Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants do
    #nest reviews inside restaurants
    #restaurants/reviews_paths
    resources :reviews, only: [:new,:create]
    # restaurants/new_routes
    collection do
      # works when you are not using :ids
      #restaurants/top
      get :top
    end
    member do
      #works when you want an :id in the path
      #restaurants/:id/chef
      get :chef
    end
  end
  resources :reviews, only: [ :destroy ]
end
