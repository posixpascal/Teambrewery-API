class CreateBasestat < ActiveRecord::Migration
  def change
    create_table :basestats do |t|
      t.integer :pokemon_id
      t.integer :hp
      t.integer :atk
      t.integer :def
      t.integer :spa
      t.integer :spd
      t.integer :spe

      t.timestamps
    end
  end
end
