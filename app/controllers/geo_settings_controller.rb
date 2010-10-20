class GeoSettingsController < ApplicationController
  
  def check_address
    unless params[:address].blank?
      @address, session[:address] = params[:address], params[:address]
      
      @distance = GoogleMaps::Directions.get_distance( Spree::Config[:address], params[:address])
      
      unless @distance == "NOT_FOUND"
        if GoogleMaps::Directions.get_distance( Spree::Config[:address], params[:address]) > Spree::Config[:delivery_distance].to_f
          @respond = false
        else
          @respond = true
        end
      else
        @respond = false
      end
    else
      @respond = false
    end
    
    respond_to do |format|
      format.js { render :json => { :response => @respond }.to_json }
    end
    
  end
end