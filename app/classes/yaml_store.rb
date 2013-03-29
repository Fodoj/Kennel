module SiteSettings
  class YamlStore
    @@path=Rails.root.join('config/settings.yml')

    def self.load()
      YAML::load(File.read(@@path))
    end

    def self.dump(config)
      File.open(@@path, 'w') do |file|
        file.write(YAML.dump(config))
      end
    end
  end
end
