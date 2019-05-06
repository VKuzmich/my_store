Rails.application.routes.draw do
  resources :items do
    get :upvote, on: :member
    get :expensive, on: :collection
  end

  # get ':controller(/:action(/:id))(.:format)'
end
