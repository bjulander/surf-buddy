class CreateBoards < ActiveRecord::Migration[5.2]
    def change
        create_table :boards do |t|
            t.string :type
            t.string :name
            t.string :material
            t.string :brand
            t.text :dimentions
            t.string :fins
            t.integer :volume
            t.integer :dings
            t.string :watertight
            t.integer :user_id
            t.timestamps null: false
        end
    end
end