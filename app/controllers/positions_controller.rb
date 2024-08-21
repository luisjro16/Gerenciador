class PositionsController < ApplicationController
  before_action :set_position, only: [ :show, :update, :edit, :destroy]
  before_action :authenticate_user!

  def index
    q_params = params[:q].present? ? params[:q].permit! : {}
    @q = Position.ransack(q_params)
  
    # Inicializa @positions com a busca do Ransack
    if current_user.access_level == 'admin'
      @positions = @q.result(distinct: true)
    else
      @positions = @q.result(distinct: true).where(department_id: current_user.departments.pluck(:id))
    end
  
    # Aplica o filtro de departamento, se presente
    if params[:department_id].present?
      @positions = @positions.where(department_id: params[:department_id])
    end
  
    # Aplica o filtro de salário
    min_salary = params[:min_salary].present? ? params[:min_salary].to_f : nil
    max_salary = params[:max_salary].present? ? params[:max_salary].to_f : nil
  
    if min_salary || max_salary
      if min_salary && max_salary
        @positions = @positions.where(base_salary: min_salary..max_salary)
      elsif min_salary
        @positions = @positions.where("base_salary >= ?", min_salary)
      elsif max_salary
        @positions = @positions.where("base_salary <= ?", max_salary)
      end
    end
  
    # Ordenação
    @positions = @positions.order(base_salary: params[:sort_order]) if params[:sort_order].present?
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
    params.require(:position).permit(:name, :description, :level, :base_salary, :requirements, :benefits, :status, :department_id)
  end
end
