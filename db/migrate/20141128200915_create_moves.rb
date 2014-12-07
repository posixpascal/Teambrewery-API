class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.string :key
      t.integer :num
      t.integer :accuracy
      t.integer :basepower
      t.string :category
      t.string :desc
      t.string :desc_short
      t.string :name
      t.integer :pp
      t.integer :priority
      t.boolean :secondary
      t.string :target
      t.integer :type_id
      t.boolean :is_viable
      t.boolean :is_contact
      t.boolean :protectable
      t.float :crit_ratio

      t.timestamps
    end
  end
end
