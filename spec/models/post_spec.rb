# -*- coding: utf-8 -*-
require 'spec_helper'

describe Post do
  it "strips preview" do
    post = Factory(:post, :title => "Come one, come on..", :preview => "  ")
    post.preview.length.should eql 0
  end

  it "assigns album" do
    post = Factory(:post, :title => "Come one, come on..")
    5.times do
      Factory(:photo)
    end
    post.assign_album(Photo.pluck(:id))

    album = Album.find_by_name("Come one, come on..")
    album.should_not be_nil
    album.photos.count.should eql 5
  end
end
