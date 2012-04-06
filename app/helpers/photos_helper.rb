# -*- coding: utf-8 -*-
module PhotosHelper
  def caption(photo)
    return photo.caption if photo.caption.present? && !photo.caption.strip.empty?
    content_tag(:em, "Нет описания")
  end

  def composer_block(photos, pet=nil)
    output = ""
    case photos.length

        when 10
          output << composer_thumb(photos.first, :composer_medium, pet)
          photos[1..8].each do |pho|
            output << composer_thumb(pho, :composer_small, pet)
          end
          output << composer_thumb(photos.last, :composer_medium, pet)

        when 9
          output << composer_thumb(photos.first, :composer_large, pet)
          photos[1..8].each do |pho|
            output << composer_thumb(pho, :composer_small, pet)
          end

        when 8
          photos.each do |pho|
            output << composer_thumb(pho, :composer_small, pet)
          end

        when 7
          photos.first(3).each do |pho|
            output << composer_thumb(pho, :composer_medium, pet)
          end
          photos.last(4).each do |pho|
            output << composer_thumb(pho, :composer_small, pet)
          end

        when 6
          output << composer_thumb(photos.first, :composer_large, pet)
          output << composer_thumb(photos[1], :composer_medium, pet)
          photos.last(4).each do |pho|
            output << composer_thumb(pho, :composer_small, pet)
          end

        when 5
          output << composer_thumb(photos.first, :composer_medium, pet)
          photos.last(4).each do |pho|
            output << composer_thumb(pho, :composer_small, pet)
          end

        when 4
          photos.each do |pho|
            output << composer_thumb(pho, :composer_medium, pet)
          end

        when 3
          output << composer_thumb(photos.first, :composer_large, pet)
          photos.last(2).each do |pho|
            output << composer_thumb(pho, :composer_medium, pet)
          end

        when 2
          photos.each do |pho|
            output << composer_thumb(pho, :composer_medium, pet)
          end

        when 1
      output << composer_thumb(photos.first, :composer_large, pet)

    end
    raw output
  end

  def composer_thumb(photo, style, pet)
    content_tag :div, :class => "photo-composer-thumb" do
      link_to( image_tag(photo.image.url(style)),
        (pet.present? ? pet_photo_path(pet, photo) : photo_path(photo)),
        :class => "photo-composer-thumb")
    end
  end
end
