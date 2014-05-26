require 'spec_helper'
require 'api/services_api_spec'


describe "The Authorizator's api is used for the rest of services in an ideas4all service suite to get data
          needed for they to be able to talk to each other. The api's endpoints are as follows:", type: :request do

  # shared_examples "are OAuth2 protected!" do
  #   it " " do
  #     action_method_names = controller.public_methods(false).reject do |methodname|
  #       methodname.to_s =~ /(_view_path|_callback_)/
  #     end
  #     action_method_names.each do |action|
  #       [:get, :post, :put, :patch, :delete].each do |verb|
  #         request.env["HTTP_AUTHORIZATION"] = "Bearer no_valid_access_token"
  #         send(verb, action) # directly calls the action bypassing defined routes.
  #         expect([401]).to include(response.status)
  #       end
  #     end
  #   end
  # end
  #
  # alias_it_behaves_like_to :all_these_endpoints, 'all these endpoints'


  include_context 'services api'

end
