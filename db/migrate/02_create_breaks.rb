class CreateBreaks < ActiveRecord::Migration[5.2]
    def change
      create_table :breaks do |t|
        t.string :location
        t.text :name
        t.string :type
        t.string :wave
        t.string :water_level
        t.integer :user_id
        t.timestamps null: false
      end
    end
  end