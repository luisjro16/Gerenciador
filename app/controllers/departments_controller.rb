class DepartmentsController < ApplicationController
  before_action :set_department, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /departments or /departments.json
  def index
    @departments = current_user.departments
  end

  # GET /departments/1 or /departments/1.json
  def show
  end

  # GET /departments/new
  def new
    @department = Department.new
  end

  # GET /departments/1/edit
  def edit
  end

  # POST /departments or /departments.json
  def create
    @department = Department.new(department_params)

    respond_to do |format|
      if @department.save
        format.html { redirect_to departments_url, notice: "Departmento foi criado" }
        format.json { render :show, status: :created, location: @department }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @department.update(department_params)
        format.html { redirect_to departments_url, notice: "Departmento foi atualizado" }
        format.json { render :show, status: :ok, location: @department }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @department.destroy!

    respond_to do |format|
      format.html { redirect_to departments_url, notice: "Departmento foi deletado" }
      format.json { head :no_content }
    end
  end

  private
    def set_department
      @department = Department.find(params[:id])
    end

    def department_params
      params.require(:department).permit(:name, :description, :code, :street, :number, :complement, :district, :city, :state, :cep, :status)
    end
end
