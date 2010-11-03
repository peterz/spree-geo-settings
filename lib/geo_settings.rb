require 'spree_core'
require 'geo_settings_hooks'

module GeoSettings
  class Engine < Rails::Engine
    
    config.autoload_paths += %W(#{config.root}/lib)
    
    def self.activate
      require 'geokit'
      require 'slim/rails'
      
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end
      
      Geokit::default_units = :kms
      
      AppConfiguration.class_eval do
        preference :address, :string
        preference :time_to_delivery, :integer
        preference :minimum_order, :float
        preference :default_units, :string, :default => Geokit::default_units
        preference :delivery_distance, :float, :default => 2
      end
      
    end
    
    config.to_prepare &method(:activate).to_proc
  end
end