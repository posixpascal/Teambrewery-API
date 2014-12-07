class AddMovesetIdToEvSpread < ActiveRecord::Migration
  def change
    add_column :ev_spreads, :moveset_id, :integer
  end
end
