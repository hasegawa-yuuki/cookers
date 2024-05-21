Rails.application.routes.draw do

  devise_for :users, path: "users", controllers: {
    sessions: 'public/users/sessions',
    registrations: 'public/users/registrations'
  }
  
  devise_for :admins, path: "admin/admins", controllers: {
    sessions: 'admin/admins/sessions',
  }
  
  scope module: :public do
    root 'home#top'
    resources :users, only: [:show, :destroy]
    resources :posts, only: [:show, :new, :create, :edit, :update, :destroy]
  end
  
  namespace :admin do
    root "home#top"
    resources :users, only: [:index, :destroy]
    resources :posts, only: [:index, :destroy]
  end
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
