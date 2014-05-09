namespace :access_token do

  desc "Revokes the last active access token issued to a the given service_name if it exists.
        Call example: rake access_token:revoke_last_active_for_service[service_name]"
  task :revoke_last_active_for_service, [:service_name] => :environment do |t, args|
    if client_application = Doorkeeper::Application.where(name: args[:service_name]).first
      if token = last_active_access_token_for_client_application(client_application)
        token.revoke
        p 'Token Revoked !!' if token.revoked?
      else
        p "No active Access Token for #{args[:service_name]} found!"
      end
    else
      p 'Service not found!'
    end
  end


  # Helpers

  def last_active_access_token_for_client_application(client_application)
    return unless client_application
    last_not_revoked = Doorkeeper::AccessToken.where(scopes:"myself", revoked_at:nil).order(:created_at).last
    last_not_revoked if last_not_revoked.accessible?
  end

end
