# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Kennel::Application.initialize!

#Initialize settings store
SiteSettings::STORE_TYPE=:Yaml # select :Yaml or ActiveRecord::Store
AdminSettings=SiteSettings::Settings.instance
