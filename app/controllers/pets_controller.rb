# -*- coding: utf-8 -*-
class PetsController < ApplicationController

  def index
    @pets = Pet.my
  end

  def show
    @pet = Pet.find(params[:id])
    @parents = @pet.parents
    @grandparents = Pet.extend_parents(@pet.parents)
    @elders = Pet.extend_parents(@grandparents)
  end

end
