class RenameUsersToEmployees < ActiveRecord::Migration[7.2]
  def change
    rename_table :Users, :Employees
  end
end
