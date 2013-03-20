require 'singleton';

class SiteSettings
  include Singleton

  attr_reader :config
  @@path=Rails.root.join('config/settings.yml')

  def initialize
    @config=YAML::load(File.read(@@path))
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
    File.open(@@path, 'w') do |file|
      file.write(YAML.dump(@config))
    end
  end


end