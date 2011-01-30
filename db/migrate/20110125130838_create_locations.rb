class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.string :room
      t.string :board
      t.string :shelf
      t.integer :changed_by

      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end
