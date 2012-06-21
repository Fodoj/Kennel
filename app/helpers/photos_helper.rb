# -*- coding: utf-8 -*-
module PhotosHelper
  def caption(photo)
    return photo.caption if photo.caption.present? && !photo.caption.strip.empty?
    content_tag(:em, "Нет описания")
  end

  def composer_block(photos, pet=nil, album=nil)
    output = ""
    case photos.length

        when 10
          output << composer_thumb(photos.first, :composer_medium, pet, album)
          photos[1..8].each do |pho|
            output << composer_thumb(pho, :composer_small, pet, album)
          end
          output << composer_thumb(photos.last, :composer_medium, pet, album)

        when 9
          output << composer_thumb(photos.first, :composer_large, pet, album)
          photos[1..8].each do |pho|
            output << composer_thumb(pho, :composer_small, pet, album)
          end

        when 8
          photos.each do |pho|
            output << composer_thumb(pho, :composer_small, pet, album)
          end

        when 7
          photos.first(3).each do |pho|
            output << composer_thumb(pho, :composer_medium, pet, album)
          end
          photos.last(4).each do |pho|
            output << composer_thumb(pho, :composer_small, pet, album)
          end

        when 6
          output << composer_thumb(photos.first, :composer_large, pet, album)
          output << composer_thumb(photos[1], :composer_medium, pet, album)
          photos.last(4).each do |pho|
            output << composer_thumb(pho, :composer_small, pet, album)
          end

        when 5
          output << composer_thumb(photos.first, :composer_medium, pet, album)
          photos.last(4).each do |pho|
            output << composer_thumb(pho, :composer_small, pet, album)
          end

        when 4
          photos.each do |pho|
            output << composer_thumb(pho, :composer_medium, pet, album)
          end

        when 3
          output << composer_thumb(photos.first, :composer_large, pet, album)
          photos.last(2).each do |pho|
            output << composer_thumb(pho, :composer_medium, pet, album)
          end

        when 2
          photos.each do |pho|
            output << composer_thumb(pho, :composer_medium, pet, album)
          end

        when 1
      output << composer_thumb(photos.first, :composer_large, pet, album)

    end
    raw output
  end

  def composer_thumb(photo, style, pet, album)
    content_tag :div, :class => "photo-composer-thumb" do
      link_to( image_tag(photo.image.url(style)),
        (pet.present? ? pet_photo_path(pet, photo) : album_photo_path(album, photo)),
        :class => "photo-composer-thumb")
    end
  end
end
