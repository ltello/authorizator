shared_context 'token authorizations prohibited routes' do

  describe 'Token Authorizations routes:' do
    validate_no_routes path:'/oauth/authorize/123', to:['doorkeeper/authorizations#show',    {code:'123'}], verbs: :get
    validate_no_routes path:'/oauth/authorize',     to:'doorkeeper/authorizations#new',                     verbs: :get
    validate_no_routes path:'/oauth/authorize',     to:'doorkeeper/authorizations#create',                  verbs: :post
    validate_no_routes path:'/oauth/authorize',     to:'doorkeeper/authorizations#update',                  verbs: [:patch, :put]
    validate_no_routes path:'/oauth/authorize',     to:'doorkeeper/authorizations#destroy',                 verbs: :delete
  end

end
