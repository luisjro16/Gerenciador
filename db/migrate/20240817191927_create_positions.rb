class CreatePositions < ActiveRecord::Migration[7.2]
  def change
    create_table :positions do |t|
      t.string :name
      t.text :description
      t.string :level
      t.decimal :base_salary
      t.text :requirements
      t.text :benefits
      t.string :status
      t.integer :department_id

      t.timestamps null: false
    end
  end
end
