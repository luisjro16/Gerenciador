class CreateDepartments < ActiveRecord::Migration[7.2]
  def change
    create_table :departments do |t|
      t.string :name
      t.text :description
      t.string :code
      t.string :street
      t.string :number
      t.string :complement
      t.string :district
      t.string :city
      t.string :state
      t.string :cep
      t.string :status

      t.timestamps
    end
  end
end
