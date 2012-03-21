class AddPreviewToPost < ActiveRecord::Migration
  def change
    add_column :posts, :preview, :text

  end
end
