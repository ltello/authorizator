require 'helpers/users_helper_spec'
require 'helpers/services_helper_spec'


shared_context "helpers:" do

  describe "Controllers and Views Helper Modules:" do

    include_context 'users helper'
    include_context 'services helper'

  end

end
