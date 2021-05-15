Rails.application.routes.draw do
  root "trades#index"
  resources :users, only: [:show]
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }  
  resources :trades

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
