class CreateBoards < ActiveRecord::Migration
    def change
        create_table :boards do |t|
            t.text :model 
            t.text :nickname
            t.text :material
            t.text :brand
            t.text :color
            t.text :dimentions
            t.text :fins
            t.text :finbox
            t.text :volume
            t.text :dings
            t.text :watertight
            t.integer :user_id
            t.timestamps null: false
        end
    end
end