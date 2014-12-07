class CreateNatures < ActiveRecord::Migration
  def change
    create_table :natures do |t|
      t.float :pdef
      t.float :hp
      t.float :patk
      t.float :spdef
      t.float :spatk
      t.float :spe

      t.timestamps
    end
  end
end
