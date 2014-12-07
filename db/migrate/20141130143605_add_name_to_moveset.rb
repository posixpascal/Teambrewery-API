class AddNameToMoveset < ActiveRecord::Migration
  def change
    add_column :movesets, :name, :string
    add_column :movesets, :nature_id, :integer
    add_column :movesets, :description, :text
  end
end
