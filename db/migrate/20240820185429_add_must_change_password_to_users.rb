class AddMustChangePasswordToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :must_change_password, :boolean
  end
end
