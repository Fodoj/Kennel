class AddCityPhoneUrlEmailToPerson < ActiveRecord::Migration
  def change
    add_column :people, :city, :string

    add_column :people, :phone, :string

    add_column :people, :url, :string

    add_column :people, :email, :string

  end
end
