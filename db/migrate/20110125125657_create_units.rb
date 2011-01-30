class CreateUnits < ActiveRecord::Migration
  def self.up
    create_table :units do |t|
      t.integer :chemical_id
      t.string :size
      t.string :source
      t.string :purchase_date
      t.date :next_check_date
      t.date :expiration_date
      t.integer :created_by
      t.integer :location_id
      t.date :destroyed_date
      t.text :destroyed_reason
      t.text :note
      t.string :sign

      t.timestamps
    end
  end

  def self.down
    drop_table :units
  end
end
