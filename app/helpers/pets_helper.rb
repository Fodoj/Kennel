# -*- coding: utf-8 -*-
module PetsHelper
  def pet_sex(pet)
    pet.sex ? "Кобель" : "Сука"
  end

  def active_admin_pets_menu(searcher)
    pets_strings_by_search(searcher, "my-pets", "puppy-pets", "all-pets")
  end

  def admin_pets_header(searcher)
    pets_strings_by_search(searcher, "Мои питомцы", "Щенки", "Питомцы")
  end

  def pets_strings_by_search(searcher, owned, puppy, default)
    if searcher.present?
      if searcher[:owned].present? && searcher[:owned]
        owned
      elsif searcher[:puppy].present? && searcher[:puppy]
        puppy
      end
    else
      default
    end
  end
end
