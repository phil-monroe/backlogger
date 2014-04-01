Backlogger::Application.routes.draw do
  get '/auth/google_oauth2/callback', to: 'sessions#google'

  resources :users do
    resources :backlogs do
      resources :stories
    end
  end

  root to: 'main#index'
end
