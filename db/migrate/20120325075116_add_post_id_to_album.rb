class AddPostIdToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :post_id, :integer

  end
end
