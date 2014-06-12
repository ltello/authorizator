require 'README_FOR_USERS_spec'
require 'README_FOR_MAINTAINERS_spec'
require 'README_FOR_ADMINS_spec'
require 'api_spec'
require 'request_spec'
require 'routing_spec'
require 'controllers_spec'
require 'views_spec'
require 'helpers_spec'


describe Apipie.configuration.app_info[Authorizator::VERSION] do

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
