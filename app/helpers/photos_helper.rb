# -*- coding: utf-8 -*-
module PhotosHelper
  def caption(photo)
    return photo.caption if photo.caption.present? && !photo.caption.strip.empty?
    content_tag(:em, "Нет описания")
  end

  def composer_block(photos)
    output = ""
    case photos.length

        when 10
          output << composer_thumb(photos.first, :composer_medium)
          photos[1..8].each do |pho|
            output << composer_thumb(pho, :composer_small)
          end
          output << composer_thumb(photos.last, :composer_medium)

        when 9
          output << composer_thumb(photos.first, :composer_large)
          photos[1..8].each do |pho|
            output << composer_thumb(pho, :composer_small)
          end

        when 8
          photos.each do |pho|
            output << composer_thumb(pho, :composer_small)
          end

        when 7
          photos.first(3).each do |pho|
            output << composer_thumb(pho, :composer_medium)
          end
          photos.last(4).each do |pho|
            output << composer_thumb(pho, :composer_small)
          end

        when 6
          output << composer_thumb(photos.first, :composer_large)
          output << composer_thumb(photos[1], :composer_medium)
          photos.last(4).each do |pho|
            output << composer_thumb(pho, :composer_small)
          end

        when 5
          output << composer_thumb(photos.first, :composer_medium)
          photos.last(4).each do |pho|
            output << composer_thumb(pho, :composer_small)
          end

        when 4
          photos.each do |pho|
            output << composer_thumb(pho, :composer_medium)
          end

        when 3
          output << composer_thumb(photos.first, :composer_large)
          photos.last(2).each do |pho|
            output << composer_thumb(pho, :composer_medium)
          end

        when 2
          photos.each do |pho|
            output << composer_thumb(pho, :composer_medium)
          end

        when 1
      output << composer_thumb(photos.first, :composer_large)

    end
    raw output
  end

  def composer_thumb(photo, style)
    content_tag :div, :class => "photo-composer-thumb" do
      link_to( image_tag(photo.image.url(style)),
        photo_path(photo), :class => "photo-composer-thumb")
    end
  end
end
