class AddProviderToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :provider, :string
    add_column :admin_users, :uid, :string
    add_column :admin_users, :name, :string
    add_column :admin_users, :nickname, :string
    add_column :admin_users, :image, :string
    add_column :admin_users, :tokens, :text
  end
end
