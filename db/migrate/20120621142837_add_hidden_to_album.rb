class AddHiddenToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :hidden, :boolean, :default => false
  end
end
