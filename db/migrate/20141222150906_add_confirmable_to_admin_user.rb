class AddConfirmableToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :confirmation_token, :string
    add_column :admin_users, :unconfirmed_email, :string
  end
end
