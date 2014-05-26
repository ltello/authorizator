require 'spec_helper'

shared_context "users index view" do

  describe "users/index" do
    let(:email1) {'user1@email.com'}
    let(:email2) {'user2@email.com'}

    before do
      assign(:users, [stub_model(User, email:email1), stub_model(User, email:email2)])
    end

    it "renders a list of users" do
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      render template: "users/index"
      expect(rendered).to match /Listing users/
      expect(rendered).to match(email1)
      expect(rendered).to match(email2)
    end
  end

end
