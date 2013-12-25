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
      response = get_url("/organizations?auth_token=#{@auth_token}")
      Hashie::Mash.new(response)
    end

    def invitations
      response = get_url("/organizations/invitations?auth_token=#{@auth_token}")
      convert_to_mashes(response)
    end

    def roles
      response = get_url("/organizations/roles?auth_token=#{@auth_token}")
      convert_to_mashes(response)
    end

    # Invite a user to your organization
    #
    # @param [Hash] args to pass to HTTParty
    #   @option [String] email (required)
    #   @option [String] name
    #   @option [String] role_id
    def invite_user(args)
      raise ArgumentError, "You must provide an email" if args[:email].nil?

      response = post_url("/organizations/invitations?auth_token=#{@auth_token}", args)
      Hashie::Mash.new(response)
    end

    private

    # POST a URL with HTTParty
    #
    # @param [String] URL to post
    # @param [Hash] params to pass to HTTParty
    def post_url(url, params={})
      response = self.class.post(url, query: params)
      response.success? ? response : raise(response.response)
    end

    # GET a URL with HTTParty
    #
    # @param [String] URL to get
    def get_url(url)
      response = self.class.get(url)
      response.success? ? response : raise(response.response)
    end

    # Convert the JSON into an Array of Mashes.
    #
    # @param [String] JSON array
    # @return [Array] array of Hashie::Mashes
    def convert_to_mashes(response)
      response.map { |budget| Hashie::Mash.new(budget) }
    end

  end
end