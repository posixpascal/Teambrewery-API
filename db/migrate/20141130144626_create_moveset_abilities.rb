class CreateMovesetAbilities < ActiveRecord::Migration
  def change
    create_table :moveset_abilities do |t|
      t.integer :moveset_id
      t.integer :ability_id

      t.timestamps
    end
  end
end
