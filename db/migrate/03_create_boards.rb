class CreateBoards < ActiveRecord::Migration
    def change
        create_table :boards do |t|
            t.string :type
            t.string :variation
            t.string :material
            t.string :brand
            t.integer :dimentions
            t.integer :volume
            t.timestamps null: false
        end
    end
end