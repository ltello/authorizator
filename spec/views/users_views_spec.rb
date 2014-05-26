require 'spec_helper'
require 'views/users/index.html.erb_spec'
require 'views/users/show.html.erb_spec'


shared_context "users views" do

  describe "Users:" do
    include_context 'users index view'
    include_context 'users show view'
  end

end
