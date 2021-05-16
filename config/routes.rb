Rails.application.routes.draw do
  root "trades#index"
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
  }  
  
  resources :users, only: [:show]
  resources :trades

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
