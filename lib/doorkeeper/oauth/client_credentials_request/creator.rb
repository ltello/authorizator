module Doorkeeper
  module OAuth
    class ClientCredentialsRequest

      class Creator

        # Persist a fresh new access token for client, scopes and attributes.
        # Also for similar(same client and scopes) revoke (if needed) previous recent ones and delete the very old ones.
        def call(client, scopes, attributes = {})
          delete_very_old_access_tokens_of!(client, scopes)
          revoke_kept_access_tokens_of!(client, scopes)
          create_new_access_token_for!(client, scopes, attributes)
        end


        private

          NUMBER_OF_PREVIOUS_ACCESS_TOKENS_TO_KEEP = 50

          # Destroy access tokens of given client and scopes considered very old: those older than the kept ones.
          def delete_very_old_access_tokens_of!(client, scopes)
            very_old_access_tokens_of(client, scopes).map(&:destroy)
          end

          # Revoke (if needed) but don't destroy a establish number of recent access tokens of given client and scopes.
          def revoke_kept_access_tokens_of!(client, scopes)
            kept_access_tokens_of(client, scopes).each {|token| token.revoke unless token.revoked?}
          end

          # Persist a fresh new access token for client, scopes and attributes.
          def create_new_access_token_for!(client, scopes, attributes)
            Doorkeeper::AccessToken.create!(attributes.merge(application_id: client.id, scopes: scopes.to_s)).tap do
              disable_cached_access_tokens_of!(client, scopes)
            end
          end

          # Those access tokens (if any) older than the ones to be kept.
          def very_old_access_tokens_of(client, scopes)
            tokens = all_access_tokens_of(client, scopes)
            number_of_old_ones = [tokens.size - NUMBER_OF_PREVIOUS_ACCESS_TOKENS_TO_KEEP, 0].max
            tokens.last(number_of_old_ones)
          end

          # The most recent established number of access tokens of given client and scopes to be kept and not destroyed.
          def kept_access_tokens_of(client, scopes)
            all_access_tokens_of(client, scopes).first(NUMBER_OF_PREVIOUS_ACCESS_TOKENS_TO_KEEP)
          end

          def all_access_tokens_of(client, scopes)
            @all_access_tokens                         ||= {}
            @all_access_tokens[client.id]              ||= {}
            @all_access_tokens[client.id][scopes.to_s] ||= Doorkeeper::AccessToken. where(application_id: client.id, scopes: scopes.to_s).
                                                                                    order(created_at: :desc).to_a
          end

          def disable_cached_access_tokens_of!(client, scopes)
            return unless (@all_access_tokens and @all_access_tokens[client.id])
            @all_access_tokens[client.id][scopes.to_s] = nil
          end
      end

    end
  end
end
