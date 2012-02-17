# -*- coding: utf-8 -*-
module PhotosHelper
  def caption(photo)
    return photo.caption if photo.caption
    content_tag(:em, "Нет описания")
  end
end
