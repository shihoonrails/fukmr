Rails.application.routes.draw do

  devise_for :users do
    devise_scope :user do
        get 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
      end
    end

    # after_sign_out_path_for メソッドを定義

  resource :user, except: [:new, :create, :destroy]

  root to: 'blogs#index'
  resources :blogs, only: [:index, :create, :destroy, :new, :show, :edit, :update]


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
