module Cloudability
  class Billing
    include HTTParty
    base_uri "https://app.cloudability.com/api/0"
    format :json

    attr_accessor :auth_token

    def initialize(options={})
      @auth_token = options[:auth_token]
      @params=[]
    end

    # Option #1 is a hash with parameter value
    # {:param1 => "period", }
    def report_by(options={})

      # TODO :: 
      # - by= : period, vendor, service, credential, account
      # https://app.cloudability.com/api/0/billing_reports?auth_token=VZSaZ65u87X2p7HqgpJv&by=vendor
      # [{"vendor_id":1,"vendor_name":"Amazon","spend":"149744.69"}]
      @params << "&by=account"    if options == :account
      @params << "&by=credential" if options == :credential
      @params << "&by=period"     if options == :period
      @params << "&by=service"    if options == :service
      @params << "&by=vendor"     if options == :vendor

      billing = get_url(@params)
      convert_to_mashes(billing)
    end

    # Find a particular period, based on its month.
    # Period must be in YY-MM-01 format with the date always 01.
    def filter_by_period(period)
      billing = get_billing_report(period)
      convert_to_mash(billing)
    end

    private

    def get_billing_report(period)
      response = self.class.get("/billing_reports?auth_token=#{@auth_token}&period=#{period}")
      response.success? ? response : raise(response.response)
    end

    def get_url(params)
      joined_param = params.join
      url = "/billing_reports?auth_token=#{@auth_token}#{joined_param}"
      response = self.class.get("/billing_reports?auth_token=#{@auth_token}#{joined_param}")
      response.success? ? response : raise(response.response)
    end

    # Convert the json into a Mash.
    def convert_to_mash(response)
      mash = Mash.new(response.first)
    end

    # Convert the json into an Array of Mashes.
    def convert_to_mashes(response)
      billings =[]
      response.each { |b| billings << Mash.new(b)}
      return billings
    end

  end
end
