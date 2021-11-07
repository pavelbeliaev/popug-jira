require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Doorkeeper < OmniAuth::Strategies::OAuth2
      # change the class name and the :name option to match your application name
      option :name, :doorkeeper

      option :client_options, {
        site: "http://localhost:3000/oauth/authorize",
        authorize_url: "http://localhost:3000/oauth/authorize"
      }

      uid { raw_info["public_id"] }

      info do
        {
          public_id: raw_info["public_id"],
          email: raw_info["email"],
          full_name: raw_info["full_name"],
          role: raw_info["role"],
          active: raw_info["active"]
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/accounts/current').parsed
      end

      # # https://github.com/intridea/omniauth-oauth2/issues/81
      # def callback_url
      #   full_host + script_name + callback_path
      # end
    end
  end
end
