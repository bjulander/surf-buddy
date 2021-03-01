class CreateUsers < ActiveRecord::Migration
    def change
      create_table :users do |t|
        t.string :username
        t.text :email
        t.string :password_digest
        t.integer :surf_spot_id
        t.timestamps null: false
      end
    end
  end