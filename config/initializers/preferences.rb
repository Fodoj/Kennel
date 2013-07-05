# require 'preferences_boxer'
# Yaml conf:
AdminSettings = PreferencesBoxer.configure do |config|
  PreferencesBoxer.store_type='yaml'
  config.path = Rails.root.join('config/settings.yml')
end

# DB conf:
# AdminSettings = PreferencesBoxer.configure do |config|
#   config.store_type = 'db'
#   config.source_record = Person.find(1)
#   config.source_field = :url
#   config.init_values = {site_name: 'test1', owner_name: 'test2', admin_login: 'root', admin_password: '$2a$10$sd66SJyZxCVjavZ2Cz3s1OsuoFawJ4Pyu/GPc98mj8k0ahSp.feQW'}
# end
