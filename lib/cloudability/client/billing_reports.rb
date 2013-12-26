module Cloudability
  class Client
    module BillingReports

      # Generate a billing report for the current user
      #
      # @param [Hash] optional parameters
      # @return [Array] array of Hashie::Mashes
      # @see http://developers.cloudability.com/resources/billing_reports/
      # @example generate report
      #   .billing_reports(vendor: 'Amazon')
      #   .billing_report(by: 'vendor')
      #   .billing_report(by: 'service', vendor: 'Amazon', period: '2012-03-01')
      def billing_report(options={})
        request = get '/1/billing_reports', options
        convert_to_mashes request
      end
    end
  end
end