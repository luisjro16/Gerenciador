class UsersController < ApplicationController
  before_action :authenticate_user! 

  def show
    @user = current_user  
  end

  def edit
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
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
end
