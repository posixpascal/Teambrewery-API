class CreateTypings < ActiveRecord::Migration
  def change
    create_table :typings do |t|
      t.integer :pokemon_id

      t.timestamps
    end
  end
end
