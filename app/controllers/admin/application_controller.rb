class Admin::ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'admin'
  before_filter :authenticate

  protected
   def authenticate
     unless ENV["RAILS_ENV"] == 'test'
      authenticate_or_request_with_http_basic do |username, password|
        username == USER_ID && password == PASSWORD
      end
     end
   end
end
