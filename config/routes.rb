Backlogger::Application.routes.draw do
  get '/auth/google_oauth2',          as: 'auth_google'
  get '/auth/google_oauth2/callback', to: 'sessions#google'
  get '/logout',                      to: 'sessions#destroy'

  resources :users do
    resources :backlogs do
      resources :stories
    end
  end

  root to: 'main#index'
end
