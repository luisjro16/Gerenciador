class AddCountryToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :country, :string
  end
end
