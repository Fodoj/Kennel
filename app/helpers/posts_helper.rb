# -*- coding: utf-8 -*-
module PostsHelper
  def post_cover(post, style=:thumb)
    if post.cover.present?
      image_tag post.cover.url(style), :class => "span2 thumbnail"
    else
      image_tag "missing_#{style.to_s}.png", :class => "span2 thumbnail"
    end
  end

  def post_preview(post)
    strip_tags(post.body.first(200))
  end
end
