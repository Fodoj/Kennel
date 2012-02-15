class AddFotherIdToPet < ActiveRecord::Migration
  def change
    add_column :pets, :father_id, :integer
  end
end
