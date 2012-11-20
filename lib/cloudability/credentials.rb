module Cloudability
  class Credentials
    include HTTParty
    base_uri "https://app.cloudability.com/api/0"
    format :json

    attr_accessor :auth_token

    def initialize(options={})
      @auth_token = options[:auth_token]
    end

    def find_all
      convert_to_mashes(get_credentials)
    end

    private

    def get_credentials
      response = self.class.get("/credentials/index?auth_token=#{self.auth_token}")
      response.success? ? response : raise(response.response)
    end

    # Convert the json into an Array of Mashes.
    def convert_to_mashes(response)
      credentials = []
      mashes = response.each { |c| credentials << Mash.new(c) }
      return credentials
    end

  end
end