require 'README_FOR_USERS_spec'
require 'README_FOR_MAINTAINERS_spec'
require 'README_FOR_ADMINS_spec'
require 'api_spec'
require 'request_spec'
require 'routing_spec'
require 'controllers_spec'
require 'views_spec'
require 'helpers_spec'


describe "The Authorizator service application is a special service inside an ideas4all service suite.
          Every service in a suite must register in this service to be assigned a pair or client id and client secret
          credentials. This will allow a registered service to talk to the Authorizator api (to request mate services info,
          talking token...) and lately (by using the obtained talking token), be able to hit mate services apis." do

  context "The Authorizator provides security to the service suite by:
             - allowing registration and management of client_applications (services) in the suite to an admin user.
             - issuing (via api) a so called talking token which is necessary for every service in the suite to present to a mate
               one in order to be authorized to receive an api answer.
             - keeping and serving info (via api) about all of the services in the suite: credentials, urls, etc.
             - revoke (via rake tasks) granted access_tokens or talking tokens." do

    include_context 'as a user:'
    include_context 'as an admin:'
    include_context 'as a maintainer:'
    include_context 'api:'
    include_context 'request:'
    include_context 'routing:'
    include_context 'controllers:'
    include_context 'views:'
    include_context 'helpers:'

  end
end
