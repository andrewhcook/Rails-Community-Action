class CreateUserInGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :user_in_groups do |t|
      t.integer :group_id
      t.integer :user_id
      t.boolean :admin

      t.timestamps
    end
  end
end
