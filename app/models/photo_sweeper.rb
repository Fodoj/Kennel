class PhotoSweeper < ActionController::Caching::Sweeper
  observe Photo # This sweeper is going to keep an eye on the photo model
 
  # If our sweeper detects that a photo was created call this
  def before_save(photo)
    if photo.on_main_changed?
      expire_fragment('home_page_slider') if photo.on_main_changed?
    end
  end

  def after_destroy(photo)
    if photo.on_main
      expire_fragment('home_page_slider')
    end
  end

  def after_save(photo)
  	expire_fragment('great_ridus_block')
    expire_fragment("photos_description_#{photo.id}")
  end
end