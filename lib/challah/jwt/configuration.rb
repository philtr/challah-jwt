module Challah
  module Jwt
    class Configuration
      attr_accessor :use_api_key

      def initialize(options = {})
        @use_api_key = options.fetch(:use_api_key, false)
      end
    end

    def self.configuration
      @configuration ||= Configuration.new
    end

    def self.configuration=(config)
      @configuration = config
    end

    def self.configure(&block)
      yield(configuration)
    end
  end
end
