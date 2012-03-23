# -*- coding: utf-8 -*-
class PhotosController < ApplicationController
  before_filter :find_photo, :except => [:index, :new, :create]

  def index
      @photos = Photo.order('created_at DESC').page params[:page]
  end

  def show
    if @photo.album.present?
      @album = @photo.album
      @photos = @album.photos.where('id != ?', @photo.id)
    end
  end

  private
  def find_photo
    @photo = Photo.find(params[:id])
  end
end
