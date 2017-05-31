Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'tweets#main'

  resources :users do
    resources :displaypic
    # , only: [:show, :new, :create] do
    #   member do
    #     patch :set_as_primary
    #   end
    # end
  end

  resources :tweets
  # , only: [:show] do
  #   resource :picture, only: [:show, :new, :create]
  # end

end
