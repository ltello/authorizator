shared_context 'users prohibited routes' do

  describe 'Users routes:' do
    validate_no_routes path:'/users/new',   to:'users#new'
    validate_no_routes path:'/users',       to:'users#create'
    validate_no_routes path:'/users/1/edit'
    validate_no_routes path:'/users/1',     to:'users#update'
    validate_no_routes path:'/users/1',     to:'users#delete'
  end

end
