shared_context "as a user:" do

  context "As a user you would want to use this service basically as an API consumer:

             The Authorizator exposes an API to be consumed via its ruby client gem named authorizator-client.
             See its documentation for details to deal with Authorizator API resources.

                 # Gemfile
                 source <private_ideas4all_gem_server_url>
                 gem 'authorizator-client' # Gemfile

             or

                 gem sources --add <private_ideas4all_gem_server_url>
                 gem install authorizator-client

             will install the client gem from the private ideas4all gem repository and server.
             Ask IT staff for a valid url of the private gem server.

             Also, you can navigate to /apidoc relative path to an Authorizator service in production

                 http://authorizator.ideas4all.com/apidoc

             to get html documentation of its API.

             Run the rest of tests in this spec folder to get details info about every API endpoint:
               - /services               #=> json list with info about every service in the suite controlled by this Authorizator service.
               - /services/talking_token #=> json with the current valid talking token info for services in the suite to secure requests." do
    it ' ' do end
  end
end
