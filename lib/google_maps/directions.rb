require 'uri'
require 'yajl'
require 'httparty'

module GoogleMaps
  String.class_eval do
    def uri_escape
      URI.escape(self, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
    end
  end
  
  module Directions
    def self.get_distance(from, to)
      api_url = "http://maps.google.com/maps/api/directions/json"
      
      url = api_url + "?origin=#{from.uri_escape}&destination=#{to.uri_escape}&sensor=false"
      
      result = Yajl::Parser.parse(HTTParty.get(url).body)
      
      if result["status"] == "OK"
        result["routes"].first["legs"].first["distance"]["value"] / Float(1000)
      else
        result["status"]
      end
    end
  end
  
end
