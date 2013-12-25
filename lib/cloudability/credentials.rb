module Cloudability
  class Credentials
    include HTTParty
    base_uri "https://app.cloudability.com/api/0"
    format :json

    attr_accessor :auth_token

    def initialize(options={})
      raise ArgumentError, "You must provide an auth token" if options[:auth_token].nil?
      @auth_token = options[:auth_token]
    end

    def find_all
      convert_to_mashes(get_credentials)
    end

    private

    def get_credentials
      response = self.class.get("/credentials/index?auth_token=#{@auth_token}")
      response.success? ? response : raise(response.response)
    end

    # Convert the JSON into an Array of Mashes.
    #
    # @param [String] JSON array
    # @return [Array] array of Hashie::Mashes
    def convert_to_mashes(response)
      response.map { |credential| Hashie::Mash.new(credential) }
    end

  end
end