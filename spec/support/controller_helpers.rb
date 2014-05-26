require 'support/routing_helpers'
require 'support/user_helpers'

module ControllerHelpers
  include RoutingHelpers
  include UserHelpers

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UsersController. Be sure to keep this updated too.
  VALID_SESSION = {}

  # Data to build a valid access token
  ACCESS_TOKEN_SCOPE = 'myself'

  # Data to build a valid talking token data hash
  TALKING_TOKEN_TYPE       = 'bearer'
  TALKING_TOKEN_EXPIRES_IN = 1000
  TALKING_TOKEN_SCOPE      = 'service_mate'
  TALKING_TOKEN_DATA       = {'token_type'   => TALKING_TOKEN_TYPE,
                              'expires_in'   => TALKING_TOKEN_EXPIRES_IN,
                              'scope'        => TALKING_TOKEN_SCOPE}

  # Some sample services (client_applications) to feed the test database with.
  SAMPLE_SERVICES = {service1: {name:'service_one', redirect_uri:'http://service1.ideas4all.com'},
                     service2: {name:'service_two', redirect_uri:'http://service2.ideas4all.com'}}

  # Creates a valid test user and sign it in!
  def log_user_in
    @request.env["devise.mapping"] = Devise.mappings[:user]
    create_user.tap {|user| sign_in(user)}
  end

  # Persist some sample services
  def create_sample_services
    SAMPLE_SERVICES.each do |key, properties|
      let!(key) {Doorkeeper::Application.create!(properties)}
    end
  end

  def sample_services_data
    service_list = SAMPLE_SERVICES.map {|key, properties| properties.except(:redirect_uri).merge(site: properties[:redirect_uri]).stringify_keys}
    {services: service_list}.stringify_keys
  end

  def create_valid_access_token
    let!(:access_token) {Doorkeeper::AccessToken.create!(application_id: 1,
                                                         scopes:         ACCESS_TOKEN_SCOPE,
                                                         expires_in:     Doorkeeper.configuration.access_token_expires_in)}
  end

  def create_valid_talking_token
    let!(:talking_token) {Doorkeeper::AccessToken.create!(application_id: 1,
                                                          scopes:         TALKING_TOKEN_SCOPE,
                                                          expires_in:     TALKING_TOKEN_EXPIRES_IN)}
  end

  def valid_talking_token_data
    talking_token = Doorkeeper::AccessToken.where(resource_owner_id: nil, scopes: TALKING_TOKEN_SCOPE).order(created_at: :desc).first
    {'access_token' => talking_token.token}.merge(TALKING_TOKEN_DATA).stringify_keys
  end

  # Simulate a received header including the valid talking token.
  def receive_valid_access_token
    @request.env.merge(authorization_header_for_access_token)
  end

  def authorization_header_for_access_token
    access_token = Doorkeeper::AccessToken.where(scopes: ACCESS_TOKEN_SCOPE).order(created_at: :desc).first
    raise "There are no access token generated!" unless access_token
    authorization_header_for(access_token)
  end

  def authorization_header_for(token)
    {"HTTP_AUTHORIZATION" => "Bearer #{token.token}"}
  end

end
