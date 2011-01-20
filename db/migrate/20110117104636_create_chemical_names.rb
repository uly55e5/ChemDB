class CreateChemicalNames < ActiveRecord::Migration
  def self.up
    create_table :chemical_names do |t|
      t.string :name, :null => false
      t.string :language, :limit => 2, :null => false
      t.integer :chemical_id

      t.timestamps
    end
  end

  def self.down
    drop_table :chemical_names
  end
end
