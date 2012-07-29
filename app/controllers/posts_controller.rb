# -*- coding: utf-8 -*-
class PostsController < ApplicationController

  caches_page :show

  def index
    @posts = Post.order("created_at DESC").page params[:page]
  end

  def show
    @post = Post.find(params[:id])
    @album = @post.album
  end

end
