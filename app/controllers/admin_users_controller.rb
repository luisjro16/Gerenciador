class AdminUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.must_change_password = true unless no_users?
    if @user.save
      redirect_to admin_users_path, notice: 'Usuário criado com sucesso.'
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      @user.update(must_change_password: false) if params[:user][:password].present?
      redirect_to admin_users_path, notice: 'Usuário atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: 'Usuário excluído com sucesso.'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :access_level, department_ids: [])
  end

  def no_users?
    User.count.zero?
  end

  def check_admin
    unless current_user.access_level == 'admin'
      redirect_to root_path, alert: 'Você não tem permissão para acessar esta página.'
    end
  end
end
