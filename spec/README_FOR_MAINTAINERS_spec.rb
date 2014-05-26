require 'spec_helper'

shared_context "as a maintainer:" do

  context "As a maintainer of the service you would do the following:

             1.- Add New Endpoints to Existing API Controllers:
               Add new actions in the controller as a normal controller. It will be OAuth2 protected by the existing controller.

             2.- Create new API Controllers and Endpoints:
               Create a new controller like a common Rails one but dont forget to protect all its actions by adding:

                    class ServicesController < ApplicationController
                      doorkeeper_for :all, :scopes => [:myself]

                      #endpoints actions
                              ...
                    end

               at the begining of the Controller definition.

           See the rest of tests in this spec/ folder for more documentation." do
    it ' ' do end
  end
end
