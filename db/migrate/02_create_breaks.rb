class CreateBreaks < ActiveRecord::Migration
    def change
      create_table :breaks do |t|
        t.text :location
        t.text :name
        t.text :break
        t.text :direction
        t.text :height
        t.text :water_level
        t.text :shakas
        t.integer :user_id
        t.timestamps null: false
      end
    end
  end