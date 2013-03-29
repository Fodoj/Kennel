# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Kennel::Application.initialize!

#SiteSettings::STORE_TYPE=:Yaml #:Yaml or :Store
AdminSettings=SiteSettings::Settings.instance
