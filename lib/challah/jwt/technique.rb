module Challah
  module Jwt
    class Technique
      TOKEN_REGEX = /^Bearer\s+(?<token>.*?)$/i

      def initialize(session)
        if auth_header = session.request.headers["Authorization"]
          @token = auth_header.match(TOKEN_REGEX) { |match| match["token"] }
        end
      end

      def authenticate
        user_model.find_by_jwt(@token)
      end

      private

      def persist?
        false
      end

      def user_model
        @user_model ||= Challah.user
      end
    end
  end
end
