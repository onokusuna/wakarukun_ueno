ActiveAdmin.register User do
  menu priority: 2

  actions :all, except: [:new, :create]

  config.batch_actions = false

  permit_params :name, :email, :encrypted_password, :status, :reset_password_token, :reset_password_sent_at, :remember_created_at

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :updated_at
    column :status
    actions
  end

  filter :id
  filter :name
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at
  filter :updated_at
  filter :status

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :status
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :email, :encrypted_password, :status, :reset_password_token, :reset_password_sent_at, :remember_created_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :email, :encrypted_password, :status, :reset_password_token, :reset_password_sent_at, :remember_created_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
