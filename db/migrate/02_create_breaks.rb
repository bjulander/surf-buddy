class CreateBreaks < ActiveRecord::Migration
    def change
      create_table :breaks do |t|
        t.string :location
        t.string :name
        t.string :type
        t.string :wave
        t.string :water_level
        t.timestamps null: false
      end
    end
  end