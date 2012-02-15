class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :color
      t.datetime :born
      t.boolean :sex
      t.string :title
      t.integer :owner_id
      t.integer :breeder_id
      t.integer :kennel_id

      t.timestamps
    end
  end
end
