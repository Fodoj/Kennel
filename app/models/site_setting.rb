class SiteSetting < ActiveRecord::Base
  store :settings, accessors: [ :site_name, :adress ]
end
