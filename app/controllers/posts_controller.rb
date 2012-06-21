# -*- coding: utf-8 -*-
class PostsController < ApplicationController

  def index
    @posts = Post.order("created_at DESC").page params[:page]
  end

  def show
    @post = Post.find(params[:id])
  end

end
