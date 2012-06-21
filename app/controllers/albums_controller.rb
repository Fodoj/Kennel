# -*- coding: utf-8 -*-
class AlbumsController < ApplicationController

  def index
    @photos = Photo.order('id DESC').last(19)
    @fresh_photo, @photos = @photos.first, @photos.last(18)
    @albums = Album.visible
  end

  def show
    @album = Album.find(params[:id])
    @photos = @album.photos.order("image_file_name ASC")
  end

end
