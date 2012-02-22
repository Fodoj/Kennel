class AddOwnedToPet < ActiveRecord::Migration
  def change
    add_column :pets, :owned, :boolean

  end
end
