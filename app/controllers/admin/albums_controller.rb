# -*- coding: utf-8 -*-
class Admin::AlbumsController < Admin::ApplicationController
  before_filter :find_album, :except => [:index, :new, :create]

  def index
    @albums = Album.sorted(params[:sort]).page params[:page]
  end

  def show
  end

  def edit
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(params[:album])
    puts @album
    if @album.save
      @album.assign_pets(params[:album][:pet_ids])
      redirect_to admin_albums_path
    end
  end

  def update
    if @album.update_attributes(params[:album])
        flash[:info] = "Альбом успешно обновлен"
    else
      flash[:error] = "Что-то пошло не так"
    end
    redirect_to admin_album_path(@album)
  end

  def destroy
    @album.destroy
    redirect_to :back
  end

  private
  def find_album
    @album = Album.find(params[:id])
  end
end
