Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :courses do
    resources :bookings, only: :create
  end
  resources :bookings, only: [:index, :destroy] do
    member do
      post 'approve_student'
    end
  end
end
