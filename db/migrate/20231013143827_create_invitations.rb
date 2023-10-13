class CreateInvitations < ActiveRecord::Migration[7.0]
  def change
    create_table :invitations do |t|
      t.integer :group_id
      t.integer :sender_id
      t.integer :recipient_id
      t.string :status

      t.timestamps
    end
  end
end
