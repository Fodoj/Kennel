class StaticContentController < ApplicationController

  include Mercury::Authentication

  layout :layout_with_mercury
  helper_method :is_editing?

  def show
    path = params[:path]

    @static_page = StaticPage.find_by_slug(path)

    unless @static_page
      render :file => "#{Rails.root}/public/404.html", :layout => false, :status => 404 and return
    end
  end

  private

  def layout_with_mercury
     !params[:mercury_frame] && is_editing? ? 'mercury' : 'application'
  end

  def is_editing?
    params[:show_editor] == 'true'
  end

end