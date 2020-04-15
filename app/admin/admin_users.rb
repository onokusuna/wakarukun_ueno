ActiveAdmin.register AdminUser do
  menu priority: 3

  config.filters = false

  actions :all, except: [:show, :new, :edit, :create, :update, :destroy]

  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :created_at
    actions
  end

end