# -*- coding: utf-8 -*-
require 'spec_helper'

describe Pet do
  it "has many children and descendants" do
    father = Factory(:pet, :name => "FatherOfHod", :sex => true)
    mother = Factory(:pet, :name => "MotherOfHod", :sex => false)

    5.times do
      pet = Factory(:pet, :mother => mother, :father => father, :sex => true)
      3.times do
        Factory(:pet, :father => pet)
      end
    end

    father.children.count.should eql 5
    mother.children.count.should eql 5

    father.descendants.count.should eql 20
    mother.descendants.count.should eql 20
  end

  it "bitch can't be father" do
    bitch = Factory(:pet, :name => "FatherOfHod", :sex => false)
    child = Pet.new(:name => "Bobby", :father => bitch)
    child.save.should be_false
  end

  it "dog can't be mother" do
    dog = Factory(:pet, :name => "FatherOfHod", :sex => true)
    child = Pet.new(:name => "Bobby", :mother => dog)
    child.save.should be_false
  end

  it "extends parents" do
    anothergrandfather = Factory(:pet, :name => "AnotherGrandFatherOfHod", :sex => true)
    anothergrandmother = Factory(:pet, :name => "AnotherGrandMotherOfHod", :sex => false)
    grandfather = Factory(:pet, :name => "GrandFatherOfHod", :sex => true)
    grandmother = Factory(:pet, :name => "GrandMotherOfHod", :sex => false)
    father = Factory(:pet,
                     :name => "FatherOfHod",  :sex => true,
                     :mother => grandmother, :father => grandfather)
    mother = Factory(:pet,
                     :name => "MotherOfHod", :sex => false,
                     :mother => anothergrandmother,  :father => anothergrandfather)
    pet = Factory(:pet, :name => "Child", :sex => true, :mother => mother, :father => father)

    pet.parents.should eql [father, mother]
    extended_parents = Pet.extend_parents(pet.parents)
    extended_parents.count.should eql 4
    extended_parents.should include(anothergrandfather, anothergrandmother, grandfather, grandmother)
  end

  it "assigns new parents" do
    pet = Factory(:pet, :name => "Jack", :sex => true)
    pet.assign_parents("Mom", "Dad")
    mom = Pet.find_by_name("Mom")
    dad = Pet.find_by_name("Dad")

    mom.should_not be_nil
    mom.sex.should be_false
    dad.should_not be_nil
    dad.sex.should be_true
    pet.father.should eql dad
    pet.mother.should eql mom
  end

  it "assigns person" do
    pet = Factory(:pet, :name => "Jack", :sex => true)
    pet.assign_person("owner", "Billy")
    pet.owner.should_not be_nil
    pet.owner.name.should eql "Billy"
  end

  it "assigns persons" do
    pet = Factory(:pet, :name => "Jack", :sex => true)
    pet.assign_persons({
      :owner => "Billy",
      :breeder => "John",
      :kennel => "Chinarose"
    })

    pet.owner.should_not be_nil
    pet.owner.name.should eql "Billy"

    pet.breeder.should_not be_nil
    pet.breeder.name.should eql "John"

    pet.kennel.should_not be_nil
    pet.kennel.name.should eql "Chinarose"
  end
end
