module RoutingHelpers

  # Creates an rspec example to test that the given path using the given verbs routes to the given controller action (:to)
  # if any or to an unspecified one if not :to given.
  # Also check that the rest of http verbs do not route there.
  def validate_routes(path:, to: :somewhere, verbs: :any)
    uppercase_verbs = Array(verbs).map {|verb| uppercase_http_verb(verb)}.compact.join('|')
    uppercase_verbs = "(#{uppercase_verbs})" if uppercase_verbs =~ /\|/
    it "#{uppercase_verbs} #{path} routes to #{to}" do
      check_routes_for(path, verbs: verbs, to:to)
      check_no_routes_for(path, verbs: other_http_verbs_than(verbs), to:to)
    end
  end

  # Creates an rspec example to test that the given path using the given verbs DO NOT route to the given controller action (:to)
  # if any or to an unspecified one if not :to given.
  def validate_no_routes(path:, to: :anywhere, verbs: :any)
    the_verbs       = Array(verbs).map {|verb| uppercase_http_verb(verb)}.compact.presence
    the_verbs     ||= http_verbs.map {|verb| uppercase_http_verb(verb)}
    uppercase_verbs = the_verbs.size > 1 ? "(#{the_verbs.join('|')})" : the_verbs.join
    it "#{uppercase_verbs} #{path} DO NOT route to #{to}" do
      check_no_routes_for(path, verbs: the_verbs, to:to)
    end
  end

  # Checks that the given path has an associated route (to to: "acontroller#anaction" if given or any controller action if not)
  # using the given verbs
  def check_routes_for(path, to: :somewhere, verbs: :any)
    valid_verbs = Array(verbs).map {|verb| key_http_verb(verb)}.compact.presence || http_verbs
    valid_verbs.each do |verb|
      if [:anywhere, :somewhere, nil, false].include?(to)
        expect(verb => path).to be_routable
      else
        expect(verb => path).to route_to(*Array(to))
      end
    end
  end

  # Checks that the given path HAS NO associated route (to to: "acontroller#anaction" if given or any controller action if not)
  # using the given verbs
  def check_no_routes_for(path, to: :anywhere, verbs: :any)
    no_valid_verbs = Array(verbs).map {|verb| key_http_verb(verb)}.compact.presence || http_verbs
    no_valid_verbs.each do |verb|
      if [:anywhere, :somewhere, nil, false].include?(to)
        expect(verb => path).not_to be_routable
      else
        expect(verb => path).not_to route_to(*Array(to))
      end
    end
  end

  # all_routes = Rails.application.routes.routes
  # require 'action_dispatch/routing/inspector'
  # inspector = ActionDispatch::Routing::RoutesInspector.new(all_routes)
  # puts inspector.format(ActionDispatch::Routing::ConsoleFormatter.new, ENV['CONTROLLER'])

  private

    def http_verbs
      [:get, :post, :put, :patch, :delete]
    end

    # Returns the symbol representation of an http verb if any.
    # Example: 'GET' => :get, :POST => :post
    def uppercase_http_verb(verb)
      str = verb.to_s.upcase
      str if http_verbs.include?(key_http_verb(verb))
    end

    # Returns the symbol representation of an http verb if any.
    # Example: 'GET' => :get, :POST => :post
    def key_http_verb(verb)
      key = verb.to_s.downcase.to_sym
      key if http_verbs.include?(key)
    end

    # Returns the symbols of the common http verbs other than the given ones.
    def other_http_verbs_than(*verbs)
      http_verbs - verbs.flatten.map(&:to_s).map(&:downcase).map(&:to_sym)
    end

end
