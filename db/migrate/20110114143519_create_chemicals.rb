class CreateChemicals < ActiveRecord::Migration
  def self.up
    create_table :chemicals do |t|
      t.integer :recommended_name_id
      t.string :casrn
      t.integer :changed_by_id
      t.text :note

      t.timestamps
    end
  end

  def self.down
    drop_table :chemicals
  end
end
