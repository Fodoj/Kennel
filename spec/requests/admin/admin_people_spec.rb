# -*- coding: utf-8 -*-
require 'spec_helper'

describe "Managing persons" do
  before do
    visit admin_pets_path
  end

  it "should divide persons by roles" do
    Factory(:person, :name => "Василий").has_role "owner"
    Factory(:person, :name => "Пётр").has_role "breeder"
    Factory(:person, :name => "Иосиф").has_role "kennel"
    click_link "Владельцы"
    page.should have_content("Василий")
    page.should_not have_content("Пётр")
    page.should_not have_content("Иосиф")
    click_link "Заводчики"
    page.should have_content("Пётр")
    page.should_not have_content("Василий")
    page.should_not have_content("Иосиф")
    click_link "Питомники"
    page.should have_content("Иосиф")
    page.should_not have_content("Пётр")
    page.should_not have_content("Василий")
  end

  it "should be able to add owner" do
    click_link "Владельцы"
    click_link "Новый Владелец"
    fill_in "person_name", :with => "Василий"
    click_button "Сохранить"
    current_path.should == admin_people_path
    page.should have_content("Василий")
  end

  it "should be able to add breeder" do
    click_link "Заводчики"
    click_link "Новый Заводчик"
    fill_in "person_name", :with => "Пётр"
    click_button "Сохранить"
    current_path.should == admin_people_path
    page.should have_content("Пётр")
  end

  it "should be able to add kennel" do
    click_link "Питомники"
    click_link "Новый Питомник"
    fill_in "person_name", :with => "Иосиф"
    click_button "Сохранить"
    current_path.should == admin_people_path
    page.should have_content("Иосиф")
  end
end
