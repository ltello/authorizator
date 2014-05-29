require 'api/services_api_spec'


shared_context "api:" do

  describe "The Authorizator's api is used for the rest of services in an ideas4all service suite to get data
            needed for they to be able to talk to each other. The api's endpoints are as follows:", type: :request do

    include_context 'services api'

  end

end
