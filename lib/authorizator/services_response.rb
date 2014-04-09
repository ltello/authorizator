module Authorizator

  class ServicesResponse
    attr_accessor :applications

    def initialize(applications)
      @applications = applications
    end

    def body
      services_list = applications.map {|app| {name: app.name, site: app.redirect_uri}}
      {services: services_list}
    end

    def status
      :ok
    end

    def headers
      {'Cache-Control' => 'no-store', 'Pragma' => 'no-cache', 'Content-Type' => 'application/json; charset=utf-8'}
    end
  end

end
