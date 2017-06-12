Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

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
  resources :tweets
  resources :likes, only: [:create, :destroy]
  # , only: [:show] do
  #   resource :picture, only: [:show, :new, :create]
  # end

end
