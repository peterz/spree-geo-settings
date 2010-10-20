class GeoSettingsHooks < Spree::ThemeSupport::HookListener

  insert_after(:admin_configurations_menu) do
    %(<tr>
      <td><%= link_to t(:geo_settings), admin_geo_settings_url %></td>
      <td><%= t(:geo_settings_description) %></td>
    </tr>)
  end

  insert_after :admin_configurations_sidebar_menu do 
    %(<li<%= raw(' class="active"') if controller.controller_name == 'geo_settings' %>>
    <%= link_to t(:geo_settings), admin_geo_settings_path %></li>) 
  end

end
