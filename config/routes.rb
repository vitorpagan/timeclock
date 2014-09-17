TimeClock::Application.routes.draw do
  resources :time_sheets

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]
  resource :time_sheet do
    get '/close/:id', to: 'time_sheets#close', as: 'close'
    get :open
  end

  root to: "home#show"
end