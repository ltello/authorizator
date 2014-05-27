shared_context 'services controller' do

  describe ServicesController do

    context "provides data needed by every service in the suite (services names and hosts, talking token...)" do
      # create_sample_services
      # create_valid_access_token
      # create_valid_talking_token
#
      # it "/services: (GET) returns a list with data for every service in the suite secured by the Authorizator." do
      #   # check_routes_for(services_path, verbs: :get)
      #   get services_path
      #   expect([401]).to include(response.status)
      #   get services_path, {}, authorization_header_for_access_token
      #   expect(response.status).to eq(200)
      #   expect(json).to eq(sample_services_data)
      # end
#
      # it "/services/talking_token: (GET) returns data of the currently valid service suite talking token." do
      #   # check_routes_for(talking_token_services_path, verbs: :get)
      #   get talking_token_services_path
      #   expect([401]).to include(response.status)
      #   get talking_token_services_path, {}, authorization_header_for_access_token
      #   expect(response.status).to eq(200)
      #   expect(json.except('expires_in')).to eq(valid_talking_token_data.except('expires_in'))
      #   expect(valid_talking_token_data['expires_in']).to be_within(60).of(json['expires_in'])
      # end
#
  ##
   ##     describe "GET index" do
   ##       it "forces the user to be logged in and" do
   ##         get :index, {}, valid_session
   ##         expect(response).to redirect_to(new_user_session_path)
   ##       end
  ##
   ##       it "renders the index view with all the registered users." do
   ##         user = log_user_in
   ##         get :index
   ##         expect(assigns(:users)).to eq([user])
   ##         expect(response).to render_template("index")
   ##       end
  ##
   ##       it "assigns all services as @services" do
   ##         service = Service.create! valid_attributes
   ##         get :index, {}, valid_session
   ##         assigns(:services).should eq([service])
   ##       end
   ##     end
  ##
   ##     describe "GET show" do
   ##       it "assigns the requested service as @service" do
   ##         service = Service.create! valid_attributes
   ##         get :show, {:id => service.to_param}, valid_session
   ##         assigns(:service).should eq(service)
   ##       end
   ##     end
  ##
   ##     describe "GET new" do
   ##       it "assigns a new service as @service" do
   ##         get :new, {}, valid_session
   ##         assigns(:service).should be_a_new(Service)
   ##       end
   ##     end
  ##
   ##     describe "GET edit" do
   ##       it "assigns the requested service as @service" do
   ##         service = Service.create! valid_attributes
   ##         get :edit, {:id => service.to_param}, valid_session
   ##         assigns(:service).should eq(service)
   ##       end
   ##     end
  ##
   ##     describe "POST create" do
   ##       describe "with valid params" do
   ##         it "creates a new Service" do
   ##           expect {
   ##             post :create, {:service => valid_attributes}, valid_session
   ##           }.to change(Service, :count).by(1)
   ##         end
  ##
   ##         it "assigns a newly created service as @service" do
   ##           post :create, {:service => valid_attributes}, valid_session
   ##           assigns(:service).should be_a(Service)
   ##           assigns(:service).should be_persisted
   ##         end
  ##
   ##         it "redirects to the created service" do
   ##           post :create, {:service => valid_attributes}, valid_session
   ##           response.should redirect_to(Service.last)
   ##         end
   ##       end
  ##
   ##       describe "with invalid params" do
   ##         it "assigns a newly created but unsaved service as @service" do
   ##           # Trigger the behavior that occurs when invalid params are submitted
   ##           Service.any_instance.stub(:save).and_return(false)
   ##           post :create, {:service => {  }}, valid_session
   ##           assigns(:service).should be_a_new(Service)
   ##         end
  ##
   ##         it "re-renders the 'new' template" do
   ##           # Trigger the behavior that occurs when invalid params are submitted
   ##           Service.any_instance.stub(:save).and_return(false)
   ##           post :create, {:service => {  }}, valid_session
   ##           response.should render_template("new")
   ##         end
   ##       end
   ##     end
  ##
   ##     describe "PUT update" do
   ##       describe "with valid params" do
   ##         it "updates the requested service" do
   ##           service = Service.create! valid_attributes
   ##           # Assuming there are no other services in the database, this
   ##           # specifies that the Service created on the previous line
   ##           # receives the :update_attributes message with whatever params are
   ##           # submitted in the request.
   ##           Service.any_instance.should_receive(:update).with({ "these" => "params" })
   ##           put :update, {:id => service.to_param, :service => { "these" => "params" }}, valid_session
   ##         end
  ##
   ##         it "assigns the requested service as @service" do
   ##           service = Service.create! valid_attributes
   ##           put :update, {:id => service.to_param, :service => valid_attributes}, valid_session
   ##           assigns(:service).should eq(service)
   ##         end
  ##
   ##         it "redirects to the service" do
   ##           service = Service.create! valid_attributes
   ##           put :update, {:id => service.to_param, :service => valid_attributes}, valid_session
   ##           response.should redirect_to(service)
   ##         end
   ##       end
  ##
   ##       describe "with invalid params" do
   ##         it "assigns the service as @service" do
   ##           service = Service.create! valid_attributes
   ##           # Trigger the behavior that occurs when invalid params are submitted
   ##           Service.any_instance.stub(:save).and_return(false)
   ##           put :update, {:id => service.to_param, :service => {  }}, valid_session
   ##           assigns(:service).should eq(service)
   ##         end
  ##
   ##         it "re-renders the 'edit' template" do
   ##           service = Service.create! valid_attributes
   ##           # Trigger the behavior that occurs when invalid params are submitted
   ##           Service.any_instance.stub(:save).and_return(false)
   ##           put :update, {:id => service.to_param, :service => {  }}, valid_session
   ##           response.should render_template("edit")
   ##         end
   ##       end
   ##     end
  ##
   ##     describe "DELETE destroy" do
   ##       it "destroys the requested service" do
   ##         service = Service.create! valid_attributes
   ##         expect {
   ##           delete :destroy, {:id => service.to_param}, valid_session
   ##         }.to change(Service, :count).by(-1)
   ##       end
  ##
   ##       it "redirects to the services list" do
   ##         service = Service.create! valid_attributes
   ##         delete :destroy, {:id => service.to_param}, valid_session
   ##         response.should redirect_to(services_url)
   ##       end
   ##     end
  ##
    end

  end

end
