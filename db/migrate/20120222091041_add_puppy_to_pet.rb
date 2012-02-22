class AddPuppyToPet < ActiveRecord::Migration
  def change
    add_column :pets, :puppy, :boolean

  end
end
