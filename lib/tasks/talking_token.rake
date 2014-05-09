namespace :talking_token do

  # TASK DEFINITIONS

  desc "Revoke last issued talking token"
  task :revoke_last_active => :environment do
    if token = last_active_talking_token
      token.revoke
      p "Token Revoked !!" if token.revoked?
    else
      p "No active Talking Token found!"
    end
  end


  # Helpers

  def last_active_talking_token
    last_not_revoked = Doorkeeper::AccessToken.where(scopes:"service_mate", revoked_at:nil).order(:created_at).last
    last_not_revoked if last_not_revoked.accessible?
  end

end
