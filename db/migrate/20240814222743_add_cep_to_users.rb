class AddCepToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :cep, :integer
  end
end
