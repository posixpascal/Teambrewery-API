class AddIsRecommendedToMovesets < ActiveRecord::Migration
  def change
    add_column :movesets, :is_recommended, :boolean
    add_column :movesets, :author, :string
  end
end
