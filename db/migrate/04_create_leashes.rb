class CreateLeashes < ActiveRecord::Migration[5.2]
    def change
        create_table :leashes do |t|
            t.string :brand
            t.text :length
            t.string :color
            t.integer :user_id
            t.timestamps null: false
        end
    end
end