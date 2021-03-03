class CreateLeashes < ActiveRecord::Migration
    def change
        create_table :leashes do |t|
            t.text :brand
            t.text :length
            t.text :thickness
            t.text :color
            t.integer :user_id
            t.timestamps null: false
        end
    end
end