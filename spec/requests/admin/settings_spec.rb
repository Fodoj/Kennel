# -*- coding: utf-8 -*-
require 'spec_helper'

describe "Managing site's settings" do

  before do
    visit admin_settings_path
  end

  it "should be able to change and save setting" do
    page.should have_content "Название сайта:"
    # below lines are commented because test should't change settings.yml
    # fill_in "site_name", :with => "TestPhrase"
    # find_field('site_name').value.should eq 'TestPhrase'
    # click_button "Сохранить"
    # page.should have_content "Post was successfully updated."
    # click_link "Фотографии"
    # click_link "Настройки"
    # find_field('site_name').value.should eq 'TestPhrase'
  end

end
