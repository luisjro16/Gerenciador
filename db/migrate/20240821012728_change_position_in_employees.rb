class ChangePositionInEmployees < ActiveRecord::Migration[7.2]
  def change
    add_reference :employees, :position, foreign_key: true
  end
end
