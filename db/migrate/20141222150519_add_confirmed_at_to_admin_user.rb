class AddConfirmedAtToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :confirmed_at, :timestamp
  end
end
