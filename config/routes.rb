Rails.application.routes.draw do
  root "tests#index"

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout },
                     controllers: { sessions: 'admin/sessions' }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :results, only: %i[show update index] do
    member do
      get :result
      resources :gists, only: %i[create]
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, except: :index, shallow: true do
        resources :answers, except: :index, shallow: true
      end
    end

    resources :gists, only: %i[index]

    resources :badges
  end

  resources :feedbacks, only: %i[new create]
end
