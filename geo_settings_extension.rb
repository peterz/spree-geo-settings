# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class GeoSettingsExtension < Spree::Extension
  version "1.0"
  description "Spree extension for restricting orders to predefined delivery distance."
  url "http://github.com/peterz/spree-geo-settings"

  def self.require_gems(config)
    config.gem "geokit", :version => '~> 1.5.0'
  end

  def activate
    Geokit::default_units = :kms

    AppConfiguration.class_eval do
      preference :address, :string
      preference :time_to_delivery, :integer
      preference :minimum_order, :float
      preference :default_units, :string, :default => Geokit::default_units
      preference :delivery_distance, :float, :default => 2
    end

    CheckoutsController.send(:include, Spree::GeoSettings::CheckoutsController)
  end

end
