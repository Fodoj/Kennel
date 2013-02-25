# -*- coding: utf-8 -*-
require 'spec_helper'

describe "Admin authenticate" do

  it "should not be able enter to admin page" do
    Factory( :person, :name => ROOT_USER)
    Factory( :photo, :id => 1, :caption => "Test image", :image_file_name => "samplimg.jpg", :image_content_type => "image/jpeg", :image_file_size => 8387, :on_main => false )

    ENV["RAILS_ENV"] = 'development'
    visit admin_path
    assert_equal 401, page.status_code
    ENV["RAILS_ENV"] = 'test'

  end

  it "should be able login to admin dash" do
    Factory( :person, :name => ROOT_USER)
    Factory( :photo, :id => 1, :caption => "Test image", :image_file_name => "samplimg.jpg", :image_content_type => "image/jpeg", :image_file_size => 8387, :on_main => false )

    ENV["RAILS_ENV"] = 'development'
    page.driver.browser.authorize ROOT_USER, ROOT_PASSWORD
    visit admin_path
    assert_equal 200, page.status_code
    ENV["RAILS_ENV"] = 'test'

  end
end
