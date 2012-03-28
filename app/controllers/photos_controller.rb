# -*- coding: utf-8 -*-
class PhotosController < ApplicationController

  def index
      @photos = Photo.order('created_at DESC').page params[:page]
  end

  def show
    @photo = Photo.find(params[:id])
    if @photo.album.present?
      @album = @photo.album
      @photos = @album.photos.order('id ASC')
    end
  end

end
