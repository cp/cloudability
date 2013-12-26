module Cloudability
  class Client
    module UsageReports

      # List current usage reports.
      #
      # @see http://developers.cloudability.com/resources/usage/
      # @return [Array] array of Hashie::Mashes
      def usage_reports
        request = get '/1/reporting/usage'
        convert_to_mashes request
      end

      # Run a report of cost data
      #
      # @see http://developers.cloudability.com/resources/usage/
      # @param [Hash] optional parameters
      # @return [Array] array of Hashie::Mashes
      # @example running a report
      #   .run_cost_report(start_date: '2013-09-02', end_date: '2013-09-09',
      #     dimensions: 'linked_account_name', metrics: 'invoiced_cost')
      def run_usage_report(options={})
        request = get '/1/reporting/cost/run', options
        convert_to_mashes request
      end

      # List measures recognized by the server
      #
      # @see http://developers.cloudability.com/resources/usage/
      # @return [Array] array of Hashie::Mashes
      def usage_measures
        request = get '/1/reporting/measures'
        convert_to_mashes request
      end

      # List available filters for requesting data
      #
      # @see http://developers.cloudability.com/resources/usage/
      # @return [Array] array of filters as strings
      def usage_filters
        get('/1/reporting/filters').to_a
      end
      
    end
  end
end