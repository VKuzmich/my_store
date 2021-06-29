Rails.application.routes.draw do
  devise_for :users  do
  end
  resources :items do
    get :upvote, on: :member
    get :expensive, on: :collection
  end

  get "admin/users_count" => "admin#users_count", via: [:get, :post]
  # get ':controller(/:action(/:id))(.:format)'
end
