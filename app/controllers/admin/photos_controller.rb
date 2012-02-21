# -*- coding: utf-8 -*-
class Admin::PhotosController < Admin::ApplicationController
  before_filter :find_photo, :except => [:index, :new, :create]

  def index
      @photos = Photo.page params[:page]
  end

  def show
  end

  def edit
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(params[:photo])
    @photo.save

    redirect_to admin_photos_path
  end

  def update
    if @photo.update_attributes(params[:photo])
        flash[:info] = "Фотография успешно обновлена"
    else
      flash[:error] = "Что-то пошло не так"
    end
    redirect_to admin_photos_path
  end

  def destroy
    @photo.destroy
    redirect_to :back
  end

  private
  def find_photo
    @photo = Photo.find(params[:id])
  end
end
