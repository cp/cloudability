module Cloudability
  class Billing
    include HTTParty
    base_uri "https://app.cloudability.com/api/0"
    format :json

    attr_accessor :auth_token

    def initialize(options={})
      raise ArgumentError, "You must provide an auth token" if options[:auth_token].nil?

      @auth_token = options[:auth_token]
      @params=[]
    end

    # Define which dimension the billing report will return.
    def report_by(options={})
      case options
      when :account
        @params << "&by=account"
      when :credential
        @params << "&by=credential"
      when :period
        @params << "&by=period"
      when :service
        @params << "&by=service"
      when :vendor
        @params << "&by=vendor"
      end

      billings = get_url(@params)
      billings.map { |b| Mash.new(b) }
    end

    # Find a particular period, based on its month.
    # Period must be in YY-MM-01 format with the date always 01.
    def filter_by_period(period)
      @params << "&period=#{period}"
      single_billing = get_url(@params).first

      Mash.new(single_billing)
    end

    private

    def get_url(params)
      joined_param = params.join
      response = self.class.get("/billing_reports?auth_token=#{@auth_token}#{joined_param}")
      response.success? ? response : raise(response.response)
    end

  end
end
