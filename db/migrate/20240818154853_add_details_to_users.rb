class AddDetailsToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :name, :string
    add_column :users, :access_level, :string
    add_column :users, :department_ids, :integer
  end
end
