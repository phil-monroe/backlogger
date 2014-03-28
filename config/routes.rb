Backlogger::Application.routes.draw do
  resources :backlogs do
    resources :stories
  end
  root to: 'main#index'
end
