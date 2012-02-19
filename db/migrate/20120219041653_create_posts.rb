class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :album_id
      t.text :body

      t.timestamps
    end
  end
end
