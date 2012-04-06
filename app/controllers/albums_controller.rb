# -*- coding: utf-8 -*-
class AlbumsController < ApplicationController

  def index
    @photos = Photo.order('created_at DESC').all.last(19)
    @albums = Album.sorted(params[:sort]).page params[:page]
  end

  def show
    @album = Album.find(params[:id])
    @photos = @album.photos
  end

end
