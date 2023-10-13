class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.integer :leader_id
      t.integer :group_id

      t.timestamps
    end
  end
end
