class CreateMoveslotMoves < ActiveRecord::Migration
  def change
    create_table :moveslot_moves do |t|
      t.integer :moveslot_id
      t.integer :move_id

      t.timestamps
    end
  end
end
