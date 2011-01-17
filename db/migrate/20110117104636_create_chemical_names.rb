class CreateChemicalNames < ActiveRecord::Migration
  def self.up
    create_table :chemical_names do |t|
      t.string :name
      t.string :language
      t.integer :chemical_id

      t.timestamps
    end
  end

  def self.down
    drop_table :chemical_names
  end
end
