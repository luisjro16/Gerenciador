class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :full_name
      t.date :birth_date
      t.string :gender
      t.string :cpf
      t.string :rg
      t.text :adress
      t.string :phone
      t.string :email
      t.string :position
      t.date :hire_date
      t.decimal :salary
      t.integer :status

      t.timestamps
    end
  end
end
