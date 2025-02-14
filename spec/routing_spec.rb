require 'routing/users_routes_spec'
require 'routing/sessions_routes_spec'
require 'routing/applications_routes_spec'
require 'routing/access_tokens_routes_spec'
require 'routing/services_routes_spec'

require 'routing/users_prohibited_routes_spec'
require 'routing/sessions_prohibited_routes_spec'
require 'routing/token_authorizations_prohibited_routes_spec'


shared_context "routing:" do

  describe "Authorizator's Routes", type: :routing do

    describe "The Authorizator accepts the following routes:" do
      include_context 'users routes'
      include_context 'sessions routes'
      include_context 'applications routes'
      include_context 'access tokens routes'
      include_context 'services routes'
    end

    describe "The Authorizator MUST NOT accept the following routes:" do
      include_context 'users prohibited routes'
      include_context 'sessions prohibited routes'
      include_context 'token authorizations prohibited routes'
    end

  end

end
