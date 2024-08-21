class EmployeesController < ApplicationController
  before_action :set_employee, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!

  def index
    if current_user.access_level == 'admin'
      @employees = Employee.all
    else
      @employees = Employee.where(department_id: current_user.departments.pluck(:id))
    end
  end

  def show
    
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to employees_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @employee.update(employee_params)
      redirect_to employees_url(@employee)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @employee.destroy
      redirect_to employees_url
    else
      redirect_to @employee
    end
  end

  private

    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:full_name, :gender, :birth_date, :cpf, :rg, :cep, :country, :city, :adress, :district, :number, :complement, :phone, :email, :salary, :hire_date, :status, :photo, :terms, :position_id, :department_id)
    end
end
