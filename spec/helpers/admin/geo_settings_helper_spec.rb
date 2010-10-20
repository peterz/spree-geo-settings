require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::GeoSettingsHelper do
  
  #Delete this example and add some real ones or delete this file
  it "should include the Admin::GeoSettingsHelper" do
    included_modules = self.metaclass.send :included_modules
    included_modules.should include(Admin::GeoSettingsHelper)
  end
  
end
