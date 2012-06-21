class AddHiddenToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :hidden, :boolean
  end
end
