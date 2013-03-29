require 'singleton'
require 'yaml_store'
require 'store_store'

module SiteSettings
  class Settings 
    include Singleton

    attr_reader :config
    @@store_type=:Store

    def initialize
      # YourApp::Application.config.yourKey = 'foo'
      #todo Если установка с 0, то заполняем стандартными значениями сеттинги
      case @@store_type
        when :Yaml
        # @config=YAML::load(File.read(@@path))       
        when :Store
          SiteSetting.find_or_create_by_id 1
        else
          #todo exeption
      end
      @config={}
    end

    def method_missing(method, *args)
      name = method.to_s.gsub('=', '')
      if @config.has_key? name
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

    def get(name)
      @config[name]
    end

    def set(name, val)
      @config[name]=val

    end
  end
end