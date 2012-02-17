# -*- coding: utf-8 -*-
class Admin::AlbumsController < Admin::ApplicationController
  before_filter :find_album, :except => [:index, :new, :create]

  def index
    @albums = Album.all
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
    @album.save

    redirect_to admin_albums_path
  end

  def update
    if @album.update_attributes(params[:album])
        flash[:info] = "Фотография успешно обновлена"
    else
      flash[:error] = "Что-то пошло не так"
    end
    redirect_to admin_albums_path
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
