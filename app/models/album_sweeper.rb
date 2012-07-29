class AlbumSweeper < ActionController::Caching::Sweeper
  observe Album # This sweeper is going to keep an eye on the album model
 
  def after_save(album)
    expire_cache_for(album)
  end

  def after_destroy(album)
    expire_cache_for(album)
  end

  private
  
  def expire_cache_for(album)
    expire_page :controller => '/albums', :action => :show
    if album.post
      expire_page :controller => '/posts', :action => :show, :id => album.post.id
    end
  end
end