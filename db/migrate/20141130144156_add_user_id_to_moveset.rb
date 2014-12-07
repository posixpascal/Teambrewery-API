class AddUserIdToMoveset < ActiveRecord::Migration
  def change
    add_column :movesets, :author_id, :integer
  end
end
