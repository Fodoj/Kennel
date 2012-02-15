# -*- coding: utf-8 -*-
module PetsHelper
  def pet_sex(pet)
    pet.sex ? "Мужской" : "Женский"
  end
end
