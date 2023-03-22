Rails.application.routes.draw do
  root to: 'questions#index'

  resources :questions

  get '/questions/:id/start', to: 'questions#start'
  get '/questions/:id/delete', to: 'questions#destroy'
end
