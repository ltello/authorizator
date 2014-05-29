shared_context 'services routes' do

  describe "Services routes:" do
    validate_routes path:'/services',               to:'services#index',         verbs: :get
    validate_routes path:'/services/talking_token', to:'services#talking_token', verbs: :get
  end

end
