# -*- coding: utf-8 -*-
require 'spec_helper'

describe "Admin authenticate" do

  # !! this tests will pass, only if in PreferencesBoxer commit Singleton instance
  
  Person.create( name: 'Jhon' , url: nil)
  AdminSettings_test = PreferencesBoxer.configure do |config|
      config.store_type = 'db'
      config.source_record = Person.find(1)
      config.source_field = :url
      config.init_values = {site_name: 'test1', owner_name: 'test2', admin_login: 'root', admin_password: '$2a$10$sd66SJyZxCVjavZ2Cz3s1OsuoFawJ4Pyu/GPc98mj8k0ahSp.feQW'}
  end

  it "should not be able enter to admin page" do
    ENV["RAILS_ENV"] = 'development'
    visit admin_path
    assert_equal 401, page.status_code
    ENV["RAILS_ENV"] = 'test'
  end

  it "should be able login to admin dash" do
    Factory( :photo, :id => 1, :caption => "Test image", :image_file_name => "samplimg.jpg", :image_content_type => "image/jpeg", :image_file_size => 8387, :on_main => false )
    ENV["RAILS_ENV"] = 'development'
    page.driver.browser.authorize AdminSettings_test.admin_login, '1'
    visit admin_path
    assert_equal 200, page.status_code
    ENV["RAILS_ENV"] = 'test'
  end
end
