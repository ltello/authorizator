shared_context 'applications routes' do

  describe 'Client Applications(services) routes:' do
    validate_routes path:'/oauth/applications',        to:'doorkeeper/applications#index',               verbs: :get
    validate_routes path:'/oauth/applications',        to:'doorkeeper/applications#create',              verbs: :post
    validate_routes path:'/oauth/applications/new',    to:'doorkeeper/applications#new',                 verbs: :get
    validate_routes path:'/oauth/applications/1/edit', to:['doorkeeper/applications#edit',    {id:'1'}], verbs: :get
    validate_routes path:'/oauth/applications/1',      to:['doorkeeper/applications#show',    {id:'1'}], verbs: :get
    validate_routes path:'/oauth/applications/1',      to:['doorkeeper/applications#update',  {id:'1'}], verbs: [:patch, :put]
    validate_routes path:'/oauth/applications/1',      to:['doorkeeper/applications#destroy', {id:'1'}], verbs: :delete
  end

end
