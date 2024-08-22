class CreateEmployees < ActiveRecord::Migration[7.2]
  def change
    create_table :employees do |t|
      t.string :full_name
      t.date :birth_date
      t.string :gender
      t.string :cpf
      t.string :rg
      t.text :adress
      t.string :phone
      t.string :email
      t.date :hire_date
      t.decimal :salary
      t.string :status
      t.integer :cep
      t.string :country
      t.string :city
      t.string :district
      t.integer :number
      t.string :complement
      t.boolean :terms
      t.integer :department_id
      t.integer :position_id

      t.timestamps null: false
    end
  end
end
