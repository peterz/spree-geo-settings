module GoogleMaps
  VERSION = "0.1"
end

path = File.expand_path(File.dirname(__FILE__))
$:.unshift path unless $:.include?(path)

require 'google_maps/directions'