class AddTypeIdToTypeDetail < ActiveRecord::Migration
  def change
    add_column :type_details, :type_id, :integer
  end
end
