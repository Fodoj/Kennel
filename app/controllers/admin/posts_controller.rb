# -*- coding: utf-8 -*-
class Admin::PostsController < Admin::ApplicationController
  before_filter :find_post, :except => [:index, :new, :create]

  def index
      @posts = Post.page params[:page]
  end

  def show
  end

  def edit
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    @post.save

    redirect_to admin_posts_path
  end

  def update
    if @post.update_attributes(params[:post])
        flash[:info] = "Запись успешно обновлена"
    else
      flash[:error] = "Что-то пошло не так"
    end
    redirect_to admin_posts_path
  end

  def destroy
    @post.destroy
    redirect_to :back
  end

  private
  def find_post
    @post = Post.find(params[:id])
  end
end