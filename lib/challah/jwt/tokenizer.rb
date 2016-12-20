require "jwt"

module Challah
  module Jwt
    module Tokenizer
      extend ActiveSupport::Concern

      class_methods do
        def find_by_jwt(token)
          payload = ::JWT.decode(token, Challah::Jwt.secret_key)
          id = payload.dig(0, jwt_root, "id")

          if Challah::Jwt.configuration.use_api_key
            api_key = payload.dig(0, jwt_root, "api_key")
            find_by(id: id, api_key: api_key)
          else
            find_by(id: id)
          end
        rescue JWT::DecodeError
          nil
        end

        def jwt_root
          model_name.singular
        end
      end

      def to_jwt
        ::JWT.encode(jwt_payload, Challah::Jwt.secret_key)
      end

      def jwt_attrs
        if Challah::Jwt.configuration.use_api_key
          serializable_hash.slice("id", "api_key")
        else
          serializable_hash.slice("id")
        end
      end

      def jwt_payload
        {
          jwt_root => jwt_attrs
        }
      end

      def jwt_root
        self.class.jwt_root
      end
    end
  end
end
