class CreatePetPhotos < ActiveRecord::Migration
  def change
    create_table :pet_photos do |t|
      t.integer :pet_id
      t.integer :photo_id

      t.timestamps
    end
  end
end
