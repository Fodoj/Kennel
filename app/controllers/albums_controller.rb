# -*- coding: utf-8 -*-
class AlbumsController < ApplicationController
  before_filter :find_album, :except => [:index, :new, :create, :uploader]

  def index
    @photos = Photo.order('created_at DESC').all.last(19)
    @albums = Album.sorted(params[:sort]).page params[:page]
  end

  def show
  end

  private
  def find_album
    @album = Album.find(params[:id])
  end
end
