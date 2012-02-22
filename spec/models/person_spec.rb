# -*- coding: utf-8 -*-
require 'spec_helper'

describe Person do
  it "has pets by role" do
    person = Factory(:person, :name => "Mason")
    person.has_role "owner"
    pet = Factory(:pet, :name => "Bubble", :owner => person)
    person.pets.count.should eq(1)
    person.pets_of_owner.count.should eq(1)
  end
end
