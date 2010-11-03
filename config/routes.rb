Rails.application.routes.draw do

  namespace :admin do
    resource :geo_settings
  end

  match '/check_address' => 'geo_settings#check_address'

end
