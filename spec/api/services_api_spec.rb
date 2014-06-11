shared_context 'services api' do

  describe "Services", :show_in_doc do
    create_sample_services
    create_valid_access_token
    create_valid_talking_token

    it "/services: (GET) returns a list with data for every service in the suite secured by the Authorizator." do
      get services_path
      expect([401]).to include(response.status)
      get services_path, {}, authorization_header_for_access_token
      expect(response.status).to eq(200)
      expect(json).to eq(sample_services_data)
    end

    it "/services/talking_token: (GET) returns data of the currently valid service suite talking token." do
      get talking_token_services_path
      expect([401]).to include(response.status)
      get talking_token_services_path, {}, authorization_header_for_access_token
      expect(response.status).to eq(200)
      expect(json.except('expires_in')).to eq(valid_talking_token_data.except('expires_in'))
      expect(valid_talking_token_data['expires_in']).to be_within(60).of(json['expires_in'])
    end
  end

end
