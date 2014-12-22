class CreateTypeDetails < ActiveRecord::Migration
  def change
    create_table :type_details do |t|
      t.integer :root_type_id
      t.integer :target_type_id
      t.integer :multiplier

      t.timestamps
    end
  end
end
