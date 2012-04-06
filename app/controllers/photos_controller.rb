# -*- coding: utf-8 -*-
class PhotosController < ApplicationController

  def index
    @pet = Pet.find(params[:pet_id])
    @photos = @pet.photos.order("image_file_name ASC")
  end

  def show
    @photo = Photo.find(params[:id])
    @album = @photo.album
    if params[:pet_id]
      @pet = Pet.find(params[:pet_id])
      @photos = @pet.photos.order('id ASC')
    else
      if @album.present?
        @photos = @album.photos.order('id ASC')
      end
    end
  end

end
