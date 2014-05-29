require 'views/users_views_spec'
require 'views/services_views_spec'


shared_context "views:" do

  describe "Administrator's HTML/JSON Views:", type: :view do

    include_context 'users views'
    include_context 'services views'

  end

end
