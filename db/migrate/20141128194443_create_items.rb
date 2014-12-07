class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :key
      t.string :name
      t.integer :num
      t.integer :gen
      t.string :desc
      t.integer :details_id

      t.timestamps
    end
  end
end
