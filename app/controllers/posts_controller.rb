# -*- coding: utf-8 -*-
class PostsController < ApplicationController
  before_filter :find_post, :except => [:index, :new, :create]

  def index
    @posts = Post.page params[:page]
  end

  def show
  end

  private
    def find_post
      @post = Post.find(params[:id])
    end
end
