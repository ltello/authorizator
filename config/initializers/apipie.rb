require File.expand_path('../../version.rb', __FILE__)

Apipie.configure do |config|

  config.copyright = "&copy; 2013-#{Date.current.year} ideas4all"
  config.app_name                = "Authorizator"
  config.default_version         = Authorizator::VERSION
  config.api_base_url            = ""
  config.doc_base_url            = "/apidoc"
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/services_controller.rb"
  config.show_all_examples       = true

  config.authenticate = Proc.new do
    authenticate_or_request_with_http_basic do |username, password|
      username == "michelangelo" && password == "michelangelo"
    end
  end

  config.app_info = <<DOC
The Authorizator service application is a special service inside an ideas4all service suite.

Every service in a suite must register in this service to be assigned a pair or client id and client secret
credentials. This will allow a registered service to talk to the Authorizator api (to request mate services info,
talking token...) and lately (by using the obtained talking token), be able to hit mate services apis.

The Authorizator provides security to the service suite by:
   - allowing registration and management of client_applications (services) in the suite to an admin user.
   - issuing (via api) a so called talking token which is necessary for every service in the suite to present to a mate
     one in order to be authorized to receive an api answer.
   - keeping and serving info (via api) about all of the services in the suite: credentials, urls, etc.
   - revoke (via rake tasks) granted access_tokens or talking tokens.
DOC
end
