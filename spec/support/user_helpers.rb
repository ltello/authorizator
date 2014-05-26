module UserHelpers

  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well.
  VALID_USER_ATTRIBUTES = {email:                 "test_account_#{rand(10000000)}@email.com",
                           password:              "Valid_passw0rd",
                           password_confirmation: "Valid_passw0rd"}

  # Creates (persist) a valid test user!
  def create_user(attributes={})
    User.create!(VALID_USER_ATTRIBUTES.merge(attributes))
  end

end
