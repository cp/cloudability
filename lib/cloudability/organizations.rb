module Cloudability
  class Organizations
    include HTTParty
    base_uri "https://app.cloudability.com/api/1"
    format :json

    attr_accessor :auth_token

    def initialize(options={})
      raise ArgumentError, "You must provide an auth token" if options[:auth_token].nil?

      @auth_token = options[:auth_token]
    end

    def my_organization
      Hashie::Mash.new(get_my_organization)
    end

    private

    def get_my_organization
      response = self.class.get("/organizations?auth_token=#{@auth_token}")
      response.success? ? response : raise(response.response)
    end

  end
end