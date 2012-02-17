# -*- coding: utf-8 -*-
module PetsHelper
  def pet_sex(pet)
    pet.sex ? "Кобель" : "Сука"
  end
end
