require "challah"
require "jwt"

require "challah/jwt/configuration"
require "challah/jwt/technique"
require "challah/jwt/tokenizer"
require "challah/jwt/version"

module Challah
  module Jwt
    def self.secret_key
      Rails.application.secrets.secret_key_base
    end
  end
end
