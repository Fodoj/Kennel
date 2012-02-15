class AddMotherIdToPet < ActiveRecord::Migration
  def change
    add_column :pets, :mother_id, :integer
  end
end
