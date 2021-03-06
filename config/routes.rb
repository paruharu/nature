Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root to: 'homes#top'
  get '/home/about', to: 'homes#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :post_images do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]

     collection do
     get 'search'
    end

  end
  resources :users, only: [:show, :edit, :update]

      # 地図
    # get 'maps/index'
    # root to: 'maps#index'
    # resources :maps, only: [:index]

end
