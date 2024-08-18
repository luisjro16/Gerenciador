class PositionsController < ApplicationController
  before_action :set_position, only: [ :show, :update, :edit, :destroy]
  before_action :authenticate_user!

  def index
    if current_user.access_level == 'admin'
      @positions = Position.all
    else
      @positions = Position.where(department_id: current_user.departments.pluck(:id))
    end
  end

  def show
  end

  def new
    @position = Position.new
  end

  def create
    @position = Position.new(position_params)
    
    if @position.save
      redirect_to positions_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @position.update(position_params)
      redirect_to positions_url(@position), notice: 'Cargo atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    if @position.destroy
      redirect_to positions_url, notice: 'Cargo apagado com sucesso.'
    else
      redirect_to @position
    end
  end

  private

  def set_position
    @position = Position.find(params[:id])
  end

  def position_params
    params.require(:position).permit(:name, :description, :department, :level, :base_salary, :requirements, :benefits, :status)
  end
end
