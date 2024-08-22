class ChangePositionInEmployees < ActiveRecord::Migration[7.2]
  def change
    unless column_exists?(:employees, :position_id)
      add_reference :employees, :position, foreign_key: true
    end
  end
end
