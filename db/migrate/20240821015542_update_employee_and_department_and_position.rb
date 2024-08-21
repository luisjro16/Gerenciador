class UpdateEmployeeAndDepartmentAndPosition < ActiveRecord::Migration[7.2]
  def change

    remove_column :employees, :position, :string

    remove_column :departments, :latitude, :float
    remove_column :departments, :longitude, :float

    remove_column :positions, :department, :string
  end
end
