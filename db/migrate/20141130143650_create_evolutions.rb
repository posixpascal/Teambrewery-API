class CreateEvolutions < ActiveRecord::Migration
  def change
    create_table :evolutions do |t|
      t.string :kind
      t.integer :pokemon_id
      t.integer :evolution_id

      t.timestamps
    end
  end
end
