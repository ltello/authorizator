require 'controllers/users_controller_spec'
require 'controllers/services_controller_spec'


shared_context "controllers:" do

  describe "Authorizator's Controllers", type: :controller do

    include_context 'users controller'
    include_context 'services controller'

  end

end
