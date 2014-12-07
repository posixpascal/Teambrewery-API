class CreateMovesetItems < ActiveRecord::Migration
  def change
    create_table :moveset_items do |t|
      t.integer :moveset_id
      t.integer :item_id

      t.timestamps
    end
  end
end
