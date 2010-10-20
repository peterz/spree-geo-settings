class Admin::GeoSettingsController < Admin::BaseController
  before_filter :set_geolocation, :only => [:show]

  def update
    Spree::Config.set(params[:preferences])
    
    respond_to do |f|
      f.html {
        redirect_to admin_geo_settings_path
      }
    end
  end

  private
  def set_geolocation
    if Spree::Config[:address].present?
      @lat = Geokit::Geocoders::YahooGeocoder.geocode(Spree::Config[:address]).lat
      @lng = Geokit::Geocoders::YahooGeocoder.geocode(Spree::Config[:address]).lng
    else
      @lat, @lng = nil
    end
  end

end
