class UsersController < ApplicationController
  before_action :authenticate_user!, unless: :no_users?
  before_action :check_password_change, if: :user_signed_in?

  def show
    @user = current_user  
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      @user.update(must_change_password: false) if params[:user][:password].present?
      redirect_to root_path, notice: 'Usuário editado'
    else
      puts "Update failed with errors: #{@user.errors.full_messages}"
      render :edit
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.must_change_password = true unless no_users?
    if @user.save
      redirect_to root_path, notice: 'Usuário criado com sucesso.'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :access_level, :department_ids, department_ids: [])
  end

  def no_users?
    User.count.zero?
  end

  def check_password_change
    if current_user.must_change_password && !on_password_change_page? && params.dig(:user, :password).blank?
      redirect_to edit_user_path(current_user), alert: 'Você precisa trocar sua senha.'
    end
  end

  def on_password_change_page?
    request.path == edit_user_path(current_user)
  end
end
