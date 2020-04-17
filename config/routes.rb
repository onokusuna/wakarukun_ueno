Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  get 'homes/about'

  resources :users, only: [:show, :edit, :update] do
    collection do
      get 'users/leave'
      patch 'users/active_leave'
      get 'users/thanks'
    end
  end
  resources :exhibitions, only: [:index, :show] do
    resources :congestions, only: [:create]
  end
end