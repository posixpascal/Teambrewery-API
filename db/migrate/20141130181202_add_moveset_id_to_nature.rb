class AddMovesetIdToNature < ActiveRecord::Migration
  def change
    add_column :natures, :moveset_id, :integer
  end
end
