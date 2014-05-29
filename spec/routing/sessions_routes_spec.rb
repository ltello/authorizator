shared_context 'sessions routes' do

  describe 'Sessions routes:' do
    validate_routes path:'/users/sign_in',  to:'devise/sessions#new',     verbs: :get
    validate_routes path:'/login',          to:'devise/sessions#new',     verbs: :get
    validate_routes path:'/users/sign_in',  to:'devise/sessions#create',  verbs: :post
    validate_routes path:'/users/sign_out', to:'devise/sessions#destroy', verbs: :get
    validate_routes path:'/logout',         to:'devise/sessions#destroy', verbs: :get
  end

end
