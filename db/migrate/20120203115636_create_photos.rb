class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :event_id
      t.text :caption

      t.timestamps
    end
  end
end
