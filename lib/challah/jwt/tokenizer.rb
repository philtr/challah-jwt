require "jwt"

module Challah
  module Jwt
    module Tokenizer
      extend ActiveSupport::Concern

      class_methods do
        def find_by_jwt(token)
          payload = ::JWT.decode(token, Challah::Jwt.secret_key)
          model_id = payload.dig(0, jwt_root, "id")
          find(model_id)
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
        serializable_hash.slice("id")
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
