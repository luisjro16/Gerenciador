class EmployeesController < ApplicationController
  before_action :set_employee, only: [:edit, :update, :show, :destroy]

  def index
    @employees = Employee.all
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
      @employee = employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:full_name, :gender, :birth_date, :cpf, :rg, :cep, :country, :city, :adress, :district, :number, :complement, :phone, :email, :salary, :hire_date, :position, :status, :photo, :terms)
    end
end
