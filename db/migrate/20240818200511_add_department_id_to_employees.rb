class AddDepartmentIdToEmployees < ActiveRecord::Migration[7.2]
  def change
    add_column :employees, :department_id, :integer
  end
end
