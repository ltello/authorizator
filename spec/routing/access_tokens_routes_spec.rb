shared_context 'access tokens routes' do

  describe 'Access Tokens routes:' do
    validate_routes path:'/oauth/token', to:'doorkeeper/tokens#create', verbs: :post
  end

end
