class CreateBoards < ActiveRecord::Migration
    def change
        create_table :boards do |t|
            t.text :type #not working since "on" is not a subclass"
            t.text :nickname
            t.text :material
            t.text :brand
            t.text :color
            t.text :dimentions
            t.text :fins
            t.text :finbox
            t.text :volume
            t.text :dings
            t.text :watertight #not working since "on" is not a subclass"
            t.integer :user_id
            t.timestamps null: false
        end
    end
end