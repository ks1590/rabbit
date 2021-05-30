Rails.application.routes.draw do
  root "top#index"
  resources :trades do
    collection do
      get :chart
    end    
  end

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
  }  
  
  resources :users, only: [:show]
  resources :trades
end
