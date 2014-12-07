class AddMovesetIdToMoveslot < ActiveRecord::Migration
  def change
    add_column :moveslots, :moveset_id, :integer
  end
end
