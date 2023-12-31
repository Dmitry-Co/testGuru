Rails.application.routes.draw do
  root 'tests#index'
  
  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }
  
  resources :tests, only: :index do
    post :start, on: :member
  end
  
  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end  
  
  devise_scope :user do
    get 'gurus/logout', to: 'devise/sessions#destroy', as: :destroy_guru_user_session
  end
end
