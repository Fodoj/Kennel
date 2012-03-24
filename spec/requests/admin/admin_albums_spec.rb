# -*- coding: utf-8 -*-
require 'spec_helper'

describe "Managing albmums" do

  before do
    visit admin_photos_path
  end

  it "should be able to add album" do
    click_link "Добавить альбом"
    fill_in "album_name", :with => "Прогулка с собаком"
    page.should have_content "Добавить фото"
    click_button "Сохранить"
    current_path.should == admin_albums_path
    page.should have_content("Прогулка с собаком")
    page.should have_content("Пустой альбом")
  end

  it "should show photos counter" do
      album = Factory(:album, :name => "Прогулка с собаком")
      3.times do
        Factory(:photo,
                :image => File.new("#{Rails.root}/db/sample/images/samplimg.jpg"),
                :album => album)
      end
      visit admin_albums_path
      page.should have_content("3")
  end
end
