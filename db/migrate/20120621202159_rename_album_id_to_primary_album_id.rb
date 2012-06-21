class RenameAlbumIdToPrimaryAlbumId < ActiveRecord::Migration
  def up
    rename_column :photos, :album_id, :primary_album_id
  end

  def down
  end
end
