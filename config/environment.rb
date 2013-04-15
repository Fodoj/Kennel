# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Kennel::Application.initialize!

# PreferencesBoxer.store_type='Yaml'
# PreferencesBoxer::YamlStore.path=Rails.root.join('config/settings.yml')
PreferencesBoxer.store_type='Store'
AdminSettings=PreferencesBoxer::Settings.instance
