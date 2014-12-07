class CreateAbilities < ActiveRecord::Migration
  def change
    create_table :abilities do |t|
      t.string :key
      t.string :desc
      t.string :desc_short
      t.string :name
      t.float :rating
      t.integer :num

      t.timestamps
    end
  end
end
