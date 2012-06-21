class CreateAlbumsPhotos < ActiveRecord::Migration
  def change
    create_table :albums_photos do |t|
      t.integer :album_id
      t.integer :photo_id
    end
  end
end
