class Admin::ApplicationController < ActionController::Base
  layout 'admin'
  protect_from_forgery
end
