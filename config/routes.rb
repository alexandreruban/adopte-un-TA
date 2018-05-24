Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # devise_scope :user do
  #   delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  # end

  resources :courses do
    resources :bookings, only: :create
  end
  resources :bookings, only: [:index, :destroy] do
    member do
      post 'update_approved'
    end
    collection do
      get 'my_bookings'
      get 'my_courses'
    end
  end
end
