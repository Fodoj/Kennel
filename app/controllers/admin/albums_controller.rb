# -*- coding: utf-8 -*-
class Admin::AlbumsController < Admin::ApplicationController
  before_filter :find_album, :except => [:index, :new, :create, :uploader]

  def index
    if params[:sort]
      @albums = Album.sorted(params[:sort]).page params[:page]
    else
      @albums = Album.order("id DESC").page params[:page]
    end
  end

  def show
  end

  def edit
  end

  def new
    @album = Album.new
    @photos = Photo.all
  end

  def create
    @album = Album.new(params[:album])

    if @album.save
      @album.assign_photos(params[:new_photos])
      @album.assign_pets(params[:album][:pet_ids])
      redirect_to session[:back_url] || admin_albums_path
    end
  end

  def update
    if @album.update_attributes(params[:album])
        @album.assign_photos(params[:new_photos])
        params[:pets].each do |photo_pet_ids|
          Photo.find(photo_pet_ids[0]).update_attribute(:pet_ids, photo_pet_ids[1])
        end if params[:pets]
        flash[:info] = "Альбом успешно обновлен"
    else
      flash[:error] = "Что-то пошло не так"
    end
    redirect_to session[:back_url] || admin_album_path(@album)
  end

  def destroy
    @album.destroy
    redirect_to :back
  end

  def uploader
    if params[:image]
      @photo = Photo.new(:image => params[:image])
      if @photo.save
        respond_to do |format|
          format.json {
            render :json => [@photo.to_jq_upload].to_json
          }
        end
      else
        render :json => [{:error => "custom_failure"}], :status => 304
      end
    end
  end

  private
    def find_album
      @album = Album.find(params[:id])
      @photos = Photo.all - @album.photos
    end
end
