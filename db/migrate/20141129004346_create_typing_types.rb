class CreateTypingTypes < ActiveRecord::Migration
  def change
    create_table :typing_types do |t|
      t.integer :type_id
      t.integer :typing_id

      t.timestamps
    end
  end
end
