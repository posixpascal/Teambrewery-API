class CreateMoveslots < ActiveRecord::Migration
  def change
    create_table :moveslots do |t|
      t.integer :slot

      t.timestamps
    end
  end
end
