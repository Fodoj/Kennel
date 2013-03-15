# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Kennel::Application.initialize!

AdminSettings=StoreSettings.instance
