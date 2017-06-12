Rails.application.routes.draw do
  devise_for :users
  
  root 'tweets#home'
  get 'reply', to: 'tweets#reply'

  resources :users do
    member do
      resource :displaypic
      get :following, :followers
    end
    # , only: [:show, :new, :create] do
    #   member do
    #     patch :set_as_primary
    #   end
    # end    
  end
  
  resources :relationships, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]

  resources :tweets do
    collection do
      get 'search'
    end
  end
  # , only: [:show] do
  #   resource :picture, only: [:show, :new, :create]
  # end

end
