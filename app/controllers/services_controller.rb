class ServicesController < ApplicationController
  doorkeeper_for :all, :scopes => [:myself]


  # GET /services/talking_token.json
  # Returns the talking token: the one that every service has to present to be able to talk to any other one.
  def talking_token
    talking_token = persisted_valid_talking_token || create_talking_token
    response      = Doorkeeper::OAuth::TokenResponse.new(talking_token)
    self.headers.merge!(response.headers)
    self.response_body = response.body.to_json
    self.status        = response.status
  end

  # GET /services.json
  # Returns the list of services (services suite data) this Authorizator service provides security for.
  def index
    services = Doorkeeper::Application.all
    response = Authorizator::ServicesResponse.new(services)
    self.headers.merge!(response.headers)
    self.response_body = response.body.to_json
    self.status        = response.status
  end


  private

    NUMBER_OF_PREVIOUS_TALKING_TOKENS_TO_KEEP = 50
    TALKING_TOKEN_SCOPES     = "service_mate"
    TALKING_TOKEN_EXPIRES_IN = 1800

    # The last token in the db with scopes TALKING_TOKEN_SCOPES, not revoked and not expired.
    def persisted_valid_talking_token
      last_talking_token if (last_talking_token and last_talking_token.accessible?)
    end

    # Persist a fresh new talking token.
    # Also revoke (if needed) previous recent talking tokens and delete very old ones.
    def create_talking_token
      delete_very_old_talking_tokens!
      revoke_kept_talking_tokens!
      Doorkeeper::AccessToken.create!(application_id: doorkeeper_token.application_id,
                                      expires_in:     TALKING_TOKEN_EXPIRES_IN,
                                      scopes:         TALKING_TOKEN_SCOPES).tap {disable_cached_talking_tokens!}
    end

    # Destroy talking tokens considered very old: those older than the kept ones.
    def delete_very_old_talking_tokens!
      very_old_talking_tokens.map(&:destroy)
    end

    # Revoke (if needed) but don't destroy a establish number of recent talking tokens.
    def revoke_kept_talking_tokens!
      kept_talking_tokens.each {|token| token.revoke unless token.revoked?}
    end

    def all_talking_tokens
      @all_talking_tokens ||= _talking_tokens_ar_relation.to_a
    end

    # The most recent established number of talking tokens to be kept and not destroyed.
    def kept_talking_tokens
      all_talking_tokens.first(NUMBER_OF_PREVIOUS_TALKING_TOKENS_TO_KEEP)
    end

    # Those talking tokens (if any) older than the ones to be kept.
    def very_old_talking_tokens
      all_talking_tokens.last([all_talking_tokens.size - NUMBER_OF_PREVIOUS_TALKING_TOKENS_TO_KEEP, 0].max)
    end

    # The most recent authorized talking token
    def last_talking_token
      @last_talking_token ||= _talking_tokens_ar_relation.first
    end

    def _talking_tokens_ar_relation
      Doorkeeper::AccessToken.where(resource_owner_id: nil, scopes: TALKING_TOKEN_SCOPES).order(created_at: :desc)
    end

    def disable_cached_talking_tokens!
      @all_talking_tokens = @last_talking_token = nil
    end
end
