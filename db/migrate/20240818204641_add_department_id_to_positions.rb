class AddDepartmentIdToPositions < ActiveRecord::Migration[7.2]
  def change
    add_column :positions, :department_id, :integer
  end
end
