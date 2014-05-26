require "spec_helper"


shared_context 'users routes' do

  describe 'Users routes:' do
    validate_routes path:'/users',   to:'users#index',            verbs: :get
    validate_routes path:'/users/1', to:['users#show', {id:'1'}], verbs: :get
  end

end
