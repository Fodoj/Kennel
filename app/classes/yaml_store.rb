module SiteSettings
  class YamlStore
    @@path=Rails.root.join('config/settings.yml')

    def self.set(name, val)
      config=YAML::load(File.read(@@path))
      config[name]=val
      File.open(@@path, 'w') {|f| f.write(YAML.dump(config))}
    end

    def self.get(name)
      YAML::load(File.read(@@path))[name]
    end
  end
end
