module SiteSettings
  class StoreStore
    def self.set(name, val)
      o=SiteSetting.first
      o.settings[name.to_sym]=val
      o.save
    end

    def self.get(name)
      SiteSetting.first.settings[name.to_sym]
    end
  end
end
