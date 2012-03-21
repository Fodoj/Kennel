# -*- coding: utf-8 -*-
require 'spec_helper'

describe Post do
  it "strips preview" do
    post = Factory(:post, :title => "Come one, come on..", :preview => "  ")
    post.preview.length.should eql 0
  end
end
