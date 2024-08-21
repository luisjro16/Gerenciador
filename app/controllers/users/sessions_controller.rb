# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :redirect_if_first_user, only: [:new]

  # GET /resource/sign_in
  def new
     super
   end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  private

  def redirect_if_first_user
    Rails.logger.debug "Verificando se há usuários no banco de dados..."
    if User.count.zero?
      Rails.logger.debug "Nenhum usuário encontrado. Redirecionando para a criação de conta."
      redirect_to new_user_path
    else
      Rails.logger.debug "Usuários encontrados. Procedendo para a tela de login."
    end
  end
end
