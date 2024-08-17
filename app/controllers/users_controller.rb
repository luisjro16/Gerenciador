class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :destroy]

  def index
    @users = User.all
  end

  def show
    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_url(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @user.destroy
      redirect_to users_url
    else
      redirect_to @user
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:full_name, :gender, :birth_date, :cpf, :rg, :cep, :country, :city, :adress, :district, :number, :complement, :phone, :email, :salary, :hire_date, :position, :status, :photo, :terms)
    end
end
