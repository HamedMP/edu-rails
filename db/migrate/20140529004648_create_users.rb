class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :full_name
      t.string :oauth_token
      t.string :email

      t.timestamps
    end
    add_index :users, :uid, unique: true
    add_index :users, :oauth_token, unique: true
    add_index :users, :email, unique: true
  end
end
