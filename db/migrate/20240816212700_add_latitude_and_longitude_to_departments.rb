class AddLatitudeAndLongitudeToDepartments < ActiveRecord::Migration[7.2]
  def change
    add_column :departments, :latitude, :float
    add_column :departments, :longitude, :float
  end
end
