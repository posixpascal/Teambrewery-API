class AddConfirmationSentAtToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :confirmation_sent_at, :timestamp
  end
end
