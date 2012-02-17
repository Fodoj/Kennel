# -*- coding: utf-8 -*-
require 'spec_helper'

describe "Managing photos" do
  it "should be able to add photo, with dogs" do
    Factory(:pet, :name => "Bobby")
    visit admin_photos_path
    click_link "Добавить фотографию"
    attach_file "photo_image",  "#{Rails.root}/db/sample/images/samplimg.jpg"
    page.should have_content "Bobby"
    click_button "Сохранить"
    current_path.should == admin_photos_path
    page.should have_content "Нет описания"
  end

  it "should be able to edit photo, with dogs" do
    Factory(:photo, :image => File.new("#{Rails.root}/db/sample/images/samplimg.jpg"))
    Factory(:pet, :name => "Bobby")
    visit admin_photos_path
    click_link "Редактировать"
    check "pet_1"
    click_button "Сохранить"
    click_link "Редактировать"
    page.has_checked_field?("pet_1").should be_true
    uncheck "pet_1"
    click_button "Сохранить"
    click_link "Редактировать"
    page.has_checked_field?("pet_1").should be_false
  end
end
