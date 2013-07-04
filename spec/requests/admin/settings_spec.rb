# -*- coding: utf-8 -*-
require 'spec_helper'

describe "Managing site's settings" do

  before do
    visit admin_settings_path
  end

  Person.create( name: 'Jhon' , url: nil)
  AdminSettings = PreferencesBoxer.configure do |config|
    config.store_type = 'db'
    config.source_record = Person.find(1)
    config.source_field = :url
    config.init_values = {site_name: 'test1', owner_name: 'test2', admin_login: 'root', admin_password: '$2a$10$sd66SJyZxCVjavZ2Cz3s1OsuoFawJ4Pyu/GPc98mj8k0ahSp.feQW'}
  end

  it "should be able to change and save setting" do
    # TODO: check if Yaml::Store, then don't test. Because origin settings.yml file will changed.
    page.should have_content "Название сайта:"
    # below lines pass only for DB Store, because test should't change file settings.yml
    fill_in "site_name", :with => "TestPhrase"
    find_field('site_name').value.should eq 'TestPhrase'
    click_button "Сохранить"
    page.should have_content "Post was successfully updated."
    click_link "Фотографии"
    click_link "Настройки"
    find_field('site_name').value.should eq 'TestPhrase'
  end

end
