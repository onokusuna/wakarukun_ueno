class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # アプリケーション全体でエラーを拾う
  # StandardError=通常のプログラムで発生する可能性の高い例外クラス ex)ArgumentError NameError NoMethodError etc.
  rescue_from StandardError, with: :render_500 #unless Rails.env.development?
    rescue_from NoMemoryError, ScriptError, Interrupt, SecurityError, SignalException, SystemExit, SystemStackError, with: :only_logging unless Rails.env.development?
    rescue_from ActiveRecord::RecordNotFound, ActionController::RoutingError,with: :render_404 #unless Rails.env.development?

    # 存在しないページへのアクセス時 eはエラー内容を格納する引数？
    def render_404
      render template: 'errors/error404', status: 404, layout: 'application', content_type: 'text/html'
    end
    # サーバーの内部にエラーが発生
    def render_500
      render template: 'errors/error500', status: 500, layout: 'application', content_type: 'text/html'
    end

  protected
  def configure_permitted_parameters
    # サインアップ時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # アカウント編集の時にnameとprofileのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
