# -*- coding: utf-8 -*-
require 'spec_helper'

describe "Managing pets" do
    it "should be able to add pet", :js => true do
      Factory(:person, :name => "Василий").has_role "owner"
      Factory(:person, :name => "Пётр").has_role "breeder"
      Factory(:person, :name => "Иосиф").has_role "kennel"
      visit admin_pets_path
      click_link "Добавить питомца"
      fill_in "pet_name", :with => "Bobby"
      fill_in "pet_title", :with => "The Destroyer"
      fill_in "pet_color", :with => "Bloody hell"
      select "Василий", :from => "pet_owner_id"
      select "Пётр", :from => "pet_breeder_id"
      select "Иосиф", :from => "pet_kennel_id"
      click_link "Кобель"
      click_button "Сохранить"
      current_path.should == admin_pets_path
      page.should have_content("Bobby")
      page.should have_content("Василий")
      page.should have_content("Пётр")
      page.should have_content("Иосиф")
      page.should have_content("Кобель")
      page.should have_content("Добавлен питомец 'Bobby'")
    end

    it "should be able to edit pet" do
      Factory.create(:pet, :name => "Bobby")
      visit admin_pets_path
      click_link "Редактировать питомца 'Bobby'"
      fill_in "pet_name", :with => "Bubble"
      click_button "Сохранить"
      page.should have_content("Bubble")
      page.should have_content("Питомец 'Bubble' успешно обновлен")
    end

    it "should be able to destroy pet" do
      Factory.create(:pet, :name => "Bobby")
      visit admin_pets_path
      click_link "Удалить питомца 'Bobby'"
      current_path.should == admin_pets_path
      page.should have_content("Питомец 'Bobby' удалён")
      Pet.find_by_name("Bobby").nil?.should be_true
    end

    it "should be able to unbind photo", :js => true do
      pet = Factory(:pet, :name => "Bobby")
      pet.photos << Factory(:photo, :image => File.new("#{Rails.root}/db/sample/images/samplimg.jpg"))
      visit edit_admin_pet_path(pet)
      click_link "Открепить фото"
      click_button "Сохранить"
      pet.photos.count.should eq(0)
    end

    it "should separate puppies and owned pets from others" do
      Factory(:pet, :name => "LittlePuppy", :puppy => true)
      Factory(:pet, :name => "SlaveDog", :owned => true)
      Factory(:pet, :name => "SlavePuppy", :owned => true, :puppy => true)

      visit admin_pets_path
      page.should have_content "LittlePuppy"
      page.should have_content "SlaveDog"
      page.should have_content "SlavePuppy"

      click_link "Щенки"
      page.should have_content "LittlePuppy"
      page.should_not have_content "SlaveDog"
      page.should have_content "SlavePuppy"

      click_link "Мои питомцы"
      page.should_not have_content "LittlePuppy"
      page.should have_content "SlaveDog"
      page.should have_content "SlavePuppy"
    end
end
