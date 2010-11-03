CheckoutController.class_eval do
  include GoogleMaps

  before_filter :check_delivery_distance

  private
  def check_delivery_distance
    if params[:state] == "address" && params[:order]
      get_distance

      if @distance.kind_of?(Float) && @distance > Spree::Config[:delivery_distance].to_f
        flash[:error] = t('out_of_range', :distance => Spree::Config[:delivery_distance])
        redirect_to checkout_state_path(@order.state)
      end
    end
  end

  def get_distance
    @distance = GoogleMaps::Directions.get_distance( Spree::Config[:address], get_address(params))
  end

  def get_address(opts={})
    if opts[:order][:ship_address_attributes].has_key?(:address1)
      "#{opts[:order][:ship_address_attributes][:address1]}, #{opts[:order][:ship_address_attributes][:city]}"
    else
      "#{opts[:order][:bill_address_attributes][:address1]}, #{opts[:order][:bill_address_attributes][:city]}"
    end
  end
  
end