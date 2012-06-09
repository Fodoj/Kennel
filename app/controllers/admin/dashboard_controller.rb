class Admin::DashboardController < Admin::ApplicationController
  def home
    @random_photo = Photo.order("RANDOM()").last
  end
end
