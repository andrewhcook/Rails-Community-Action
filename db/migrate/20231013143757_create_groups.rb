class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.integer :creator_id
      t.text :mission_statement
      t.string :title
      t.boolean :private

      t.timestamps
    end
  end
end
