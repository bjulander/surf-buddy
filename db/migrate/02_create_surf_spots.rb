class CreateSurfSpots < ActiveRecord::Migration
    def change
      create_table :surf_spots do |t|
        t.string :location
        t.timestamps null: false
      end
    end
  end