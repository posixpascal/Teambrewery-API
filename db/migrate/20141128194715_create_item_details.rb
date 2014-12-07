class CreateItemDetails < ActiveRecord::Migration
  def change
    create_table :item_details do |t|
      t.integer :item_id
      t.boolean :megastone
      t.integer :mega_evolves
      t.boolean :berry
      t.string :naturalgift
      t.integer :naturalgift_bp
      t.integer :naturalgift_type
      t.boolean :fling
      t.integer :fling_bp
      t.boolean :unreleased

      t.timestamps
    end
  end
end
