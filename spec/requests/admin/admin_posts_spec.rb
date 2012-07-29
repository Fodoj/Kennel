# -*- coding: utf-8 -*-
require 'spec_helper'

describe "Managing posts" do

  before do
    Factory(:photo, :id => "999")
    visit admin_posts_path
  end

  it "should be able to add post with new album", :js => true do
    click_link "Добавить запись"
    fill_in "post_title", :with => "Отчёт с выставки"
    page.execute_script("$('.editor').wysiwyg('setContent', 'Было круто');")
    click_link "Выбрать фотографии"
    sleep(1)
    find("#photo_999").click
    find("#close_photos_modal").click
    page.should have_content "Выбрать фотографии (1)"
    click_button "Сохранить"
    current_path.should == admin_posts_path
    Post.find_by_title("Отчёт с выставки").should_not be_nil
    Album.find_by_name("Отчёт с выставки").should_not be_nil
  end
end
