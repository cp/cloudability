module Cloudability
  class Client
    module BillingReports

      # Generate a report of your spend
      #
      # @param [Hash] optional parameters
      # @return [Array<Hashie::Mash>] array of Hashie::Mashes
      # @see http://developers.cloudability.com/resources/billing_reports/
      # @example generate report
      #   .billing_report(vendor: 'Amazon')
      #   .billing_report(by: 'vendor')
      #   .billing_report(by: 'service', vendor: 'Amazon', period: '2012-03-01')
      def billing_report(options={})
        request = get '/1/billing_reports', options
        convert_to_mashes request
      end
      alias :billing_reports :billing_report

    end
  end
end
