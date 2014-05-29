require 'requests/users_spec'


shared_context "request:" do

  describe "Other non-api requests that can be made to the Authorizator service:", type: :request do

    include_context 'users requests'

  end

end
