require 'singleton'
require 'yaml_store'
require 'store_store'

module SiteSettings
  class Settings 
    include Singleton

    def initialize
      #todo Если начальная установка, то наверное заполняем сеттинги стандартными значениями
      case STORE_TYPE
        when :Yaml
          @handler=SiteSettings::YamlStore       
        when :Store
          SiteSetting.find_or_create_by_id 1, settings: {site_name: 'test1', owner_name: 'test2', admin_login: 'root', admin_password: '$2a$10$sd66SJyZxCVjavZ2Cz3s1OsuoFawJ4Pyu/GPc98mj8k0ahSp.feQW'}
          @handler=SiteSettings::StoreStore       
        else
          #todo exeption
      end
    end

    def method_missing(method, *args)
      name = method.to_s.gsub('=', '')
      if true #todo @config.has_key? name
        if method.to_s =~ /=$/
          set(name, args.first)
        else
          get(name)        
        end
      else
        super
      end
    end

    private
      def set(name, val)
        @handler.set name, val
      end

      def get(name)
        @handler.get name
      end
  end
end