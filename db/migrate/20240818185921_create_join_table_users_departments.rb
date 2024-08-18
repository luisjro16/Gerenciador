class CreateJoinTableUsersDepartments < ActiveRecord::Migration[7.2]
  def change
    create_join_table :users, :departments do |t|
      t.index [:user_id, :department_id]
      t.index [:department_id, :user_id]
    end
  end
end
