# Put your extension routes here.

map.namespace :admin do |admin|
  admin.resource :geo_settings
end

map.check_address 'check_address', :controller => 'geo_settings', :action => 'check_address'
