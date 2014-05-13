require 'spec_helper'

shared_context "as an admin:" do

  context "As an administrator you would want to:

             1.- Manage Users:
               /users /login /logout and other users REST routes are available to CRUD admin users of the application.
               These users will have access to critical info of the service.
               Some routes to create/delete users may not be available for security reasons. If you need to create/destroy
               an admin, activate them in config/routes.rb, users_controller, users views like any other Rails application.
               After that, please disable again the routes to keep the service as secure as possible.

             2.- Manage Client Applications:
               The service uses OAuth2 as the security protocol for external applications to access the API.
               /oauth/applications REST routes let you register, show info, etc of the registered applications (services)
               components of the service suite.
               An admin user must register here every single service of the suite, providing info about its name and host url and
               receiving a pair of credentials (id and secret) to be used in the OAuth2 dialog among the registered service
               and the Authorizator, like any OAuth2 dialog.
               Services obtaining the above credentials must include them in their config/initializers/services.rb file for the
               OAuth2 dialog to succeed.

             3.- Revoke access or talking tokens:
               Some rake tasks have been defined for an admin user to revoke a given client service last granted access_token or to
               simply revoke the last active talking token:

                   bundle exec rake access_token:revoke_last_active_for_service[service_name]
                   bundle exec rake talking_token:revoke_last_active

               run rake -T for the whole list of administration tasks.
               Access and talking tokens have a short expiration time.
               You should never need to revoke them but in case you should for security reasons, services will only continue
               using the revoked tokens for the short period of time left until expiration.

           See the rest of tests in this spec/ folder for more documentation." do
    it '' do end
  end
end
