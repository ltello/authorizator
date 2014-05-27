shared_context "users requests" do

  describe "Users Requests:" do
    let(:password)        {'jajajaja'}
    let!(:existing_admin) {create_user(password:password, password_confirmation:password)}

    it "/users: (GET) renders a view with a list of admins users of the Authorizator service." do
      get users_path
      expect(response).to redirect_to(new_user_session_path)
      follow_redirect!
      expect(response).to render_template("sessions/new")
      post user_session_path, user: {email:existing_admin.email, password:password}
      expect(response).to redirect_to(users_path)
      follow_redirect!
      expect(response.status).to eq(200)
      expect(response).to render_template('users/index')
      expect(response.body).to include(existing_admin.email)
    end


    it "/users/1: (GET) renders a view with a detailed data of the admin user with id 1." do
      user = User.first
      get user_path(user)
      expect(response).to redirect_to(new_user_session_path)
      follow_redirect!
      expect(response).to render_template("sessions/new")
      post user_session_path, user: {email:existing_admin.email, password:password}
      expect(response).to redirect_to(user_path(user))
      follow_redirect!
      expect(response.status).to eq(200)
      expect(response).to render_template('users/show')
      expect(response.body).to include(user.email)
    end

  end

end
