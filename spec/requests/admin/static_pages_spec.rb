# -*- coding: utf-8 -*-
require 'spec_helper'

describe "Managing static pages" do

  before do
    visit admin_static_pages_path
  end

  it "should be able to add static page" do
    click_link "Добавить страницу"
    fill_in "static_page_name", :with => "Про чау"
    fill_in "static_page_slug", :with => "about_chau"
    click_button "Сохранить"
    current_path.should == admin_static_pages_path
    page.should have_content "Про чау"
    click_link "Редактировать страницу 'Про чау'"
    page.should have_content "Открыть редактор"
  end

end
