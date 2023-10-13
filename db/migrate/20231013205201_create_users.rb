class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :avatar_url
      t.string :contact_info
      t.text :inspirational_quote
      t.text :bio
      t.string :email

      t.timestamps
    end
  end
end
