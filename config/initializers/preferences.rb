require 'preferences_boxer'
require 'preferences_boxer/store/yaml_store'
PreferencesBoxer.store_type='Yaml'
PreferencesBoxer::YamlStore.path=Rails.root.join('config/settings.yml')
# PreferencesBoxer.store_type='Store'
AdminSettings = PreferencesBoxer::Settings.instance
