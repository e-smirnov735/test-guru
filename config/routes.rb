Rails.application.routes.draw do
  root "tests#index"

  get :signup, to: "users#new"
  get :login, to: "sessions#new"

  resources :users, only: :create
  resources :sessions, only: %i[create destroy]

  resources :tests do
    resources :questions, except: :index, shallow: true do
      resources :answers, except: :index, shallow: true
    end

    member do
      post :start
    end
  end

  resources :results, only: %i[show update] do
    member do
      get :result
    end
  end
end
