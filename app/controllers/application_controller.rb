class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_for_users

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :access_level, department_ids: []])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :access_level, department_ids: []])
  end

  def check_for_users
    # Não redirecionar se estamos na ação `create` do controlador de `users`
    return if params[:controller] == 'users' && params[:action] == 'create'
    
    if User.count.zero? && !(params[:controller] == 'users' && params[:action] == 'new')
      redirect_to new_user_path
    end
  end
end
