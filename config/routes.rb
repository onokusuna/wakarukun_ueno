Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
                       registrations: 'users/registrations',
                       sessions: 'users/sessions'
                     }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  get 'homes/about'

  resources :users, only: [:show, :edit, :update] do
    collection do
      get 'users/leave'
      patch 'users/active_leave'
    end
  end
  resources :exhibitions, only: [:index, :show] do
    resource :congestions, only: [:create]
    resource :clips, only: [:create, :destroy]
  end
  # 存在しないパスをオプションでcontrollerをapplication,アクションをrender_404に指定
  # 一番下に書かないと他のパスも404になる？
  get '*path', controller: 'application', action: 'render_404'
end