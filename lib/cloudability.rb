require 'httparty'
require 'hashie'

require 'cloudability/client/billing_reports'
require 'cloudability/client/cost_reports'
require 'cloudability/client/usage_reports'
require 'cloudability/client/budgets'
require 'cloudability/client/credentials'
require 'cloudability/client/organizations'

require 'cloudability/version'

module Cloudability

  # Exceptions
  class RequestError < StandardError; end

  class Client
    include Cloudability::Client::BillingReports
    include Cloudability::Client::UsageReports
    include Cloudability::Client::CostReports
    include Cloudability::Client::Budgets
    include Cloudability::Client::Credentials
    include Cloudability::Client::Organizations
    include HTTParty

    def initialize(options={})
      raise ArgumentError, "You must provide an auth token" if options[:auth_token].nil?
      @auth_token = options[:auth_token]
    end

    base_uri 'https://app.cloudability.com/api'

    private

    def get(url, params={})
      response = self.class.get(url, options(query: params))
      response.success? ? response : raise(RequestError, response.message)
    end

    def post(url, params={})
      response = self.class.post(url, options(query: params))
      response.success? ? response : raise(RequestError, response.message)
    end

    def put(url, params={})
      response = self.class.put(url, options(query: params))
      response.success? ? response : raise(RequestError, response.message)
    end

    def delete(url, params={})
      response = self.class.delete(url, options(query: params))
      response.success? ? response : raise(RequestError, response.message)
    end

    # Convert the an array of hashes into an array of Mashes!
    #
    # @param [String] array of Ruby hashes
    # @return [Array<Hashie::Mash>] array of Hashie::Mashes
    def convert_to_mashes(array)
      array.map { |element| Hashie::Mash.new(element) }
    end

    def options(o={})
      o[:query] ||= {}
      o[:headers] ||= {}
      o[:headers]['User-Agent'] = "Cloudability-Ruby #{Cloudability::VERSION}"
      o[:query][:auth_token] = @auth_token
      o
    end

  end
end
