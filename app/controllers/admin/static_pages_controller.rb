# -*- coding: utf-8 -*-
class Admin::StaticPagesController < Admin::ApplicationController
  before_filter :find_static_page, :except => [:index, :new, :create]
  after_filter :expire_cache, :only => [:update, :destroy]

  respond_to :html, :js

  def index
      @static_pages = StaticPage.order("created_at DESC").page params[:static_page]
  end

  def show
  end

  def edit
  end

  def new
    @static_page = StaticPage.new
  end

  def create
    @static_page = StaticPage.new(params[:static_page])
    @static_page.save
    redirect_to admin_static_pages_path
  end

  def update
    page = StaticPage.find(params[:id])
    attributes = params[:static_page] ? params[:static_page] : {}
    if params[:content]
      attributes.merge!(
        :name => params[:content][:static_page_name][:value],
        :content => params[:content][:static_page_content][:value]
      )
    end
    if page.update_attributes(attributes)
      flash[:info] = "Страница успешно обновлена"
      respond_with(page) do |format|
        format.html { redirect_to admin_static_pages_path }
        format.js   { render text: ""}
      end
    else
      flash[:error] = "Что-то пошло не так"
      redirect_to admin_static_pages_path
    end
    
  end

  def destroy
    @static_page.destroy
    redirect_to :back
  end

  private
  def find_static_page
    @static_page = StaticPage.find(params[:id])
  end

  def expire_cache
    expire_fragment :controller => '/static_content', :action => 'show', :path => @static_page.slug
  end
end
