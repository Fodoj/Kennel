class AddOnMainToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :on_main, :boolean

  end
end
