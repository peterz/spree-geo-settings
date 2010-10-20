module Spree::GeoSettings::CheckoutsController
  include GoogleMaps

  def self.included(controller)
    controller.append_before_filter :check_delivery_distance
  end

  private
  def check_delivery_distance
    if params && params[:step] == "address" && params[:checkout]
      @distance = GoogleMaps::Directions.get_distance( Spree::Config[:address], get_address(params))
      
      unless @distance == "NOT_FOUND"
        if GoogleMaps::Directions.get_distance( Spree::Config[:address], get_address(params)) > Spree::Config[:delivery_distance].to_f
          flash[:error] = t('out_of_range', :distance => Spree::Config[:delivery_distance])
          redirect_to edit_object_url
        end
      else
        flash[:error] = t('out_of_range', :distance => Spree::Config[:delivery_distance])
        redirect_to edit_object_url
      end
    end
  end

  def get_address(opts={})
    if opts[:checkout][:ship_address_attributes].has_key?(:address1)
      "#{opts[:checkout][:ship_address_attributes][:address1]}, #{opts[:checkout][:ship_address_attributes][:city]}"
    else
      "#{opts[:checkout][:bill_address_attributes][:address1]}, #{opts[:checkout][:bill_address_attributes][:city]}"
    end
  end

end