Rails.application.routes.draw do
  resources :tests do
    resources :questions, except: :index, shallow: true do
      resources :answers, expext: :index, shallow: true
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
