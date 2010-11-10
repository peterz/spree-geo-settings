GeoSettings
===========

Extension for calculating distance for delivery. Based on entered delivery distance, extension calculate if shipping address is in that distance. If it is not order can not be proceeded. Distance is calculated based on driving direction.

You could managed following preferences:

* address - address of your store
* time_to_delivery - approximate time to deliver order
* minimum_order - minimum value of order
* delivery_distance - distance in within you deliver orders

Installation
============

1. Add `gem "geo_settings"` to your Gemfile
1. Run `bundle install`
1. Run `rake geo_settings:install`