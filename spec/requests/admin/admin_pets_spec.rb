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

end
