require 'spec_helper'


shared_context "users show view" do

  describe "users/show" do
    let(:email1) {'user1@email.com'}

    before do
      @user = assign(:user, stub_model(User, email:email1))
    end

    it "renders attributes in <p>" do
      # Run the generator again with the --webrat flag if you want to use webrat matchers
      render template: "users/show"
      expect(rendered).to match(email1)
    end
  end

end
