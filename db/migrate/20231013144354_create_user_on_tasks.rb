class CreateUserOnTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :user_on_tasks do |t|
      t.integer :user_id
      t.integer :task_id
      t.integer :group_id

      t.timestamps
    end
  end
end
