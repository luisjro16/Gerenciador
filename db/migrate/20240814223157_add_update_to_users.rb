class AddUpdateToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :city, :string
    add_column :users, :district, :string
    add_column :users, :number, :integer
    add_column :users, :complement, :string
  end
end
