Rails.application.routes.draw do

  get 'main/index'

  resources :goals

  get 'welcome/index'

  root 'welcome#index'

  get  '/login', :to => 'sessions#new'
  get '/auth/fitbit/callback', :to => 'sessions#create'
  get '/auth/failure', :to => 'sessions#failure'
  get '/logout', :to => 'sessions#destroy'

end