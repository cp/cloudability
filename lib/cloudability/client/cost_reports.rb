module Cloudability
  class Client
    module CostReports

      # List current cost reports
      #
      # @see http://developers.cloudability.com/resources/cost/
      # @return [Array] array of Hashie::Mashes
      def cost_reports
        response = get '/1/reporting/cost'
        convert_to_mashes response
      end

      # Run a report of cost data
      #
      # @see http://developers.cloudability.com/resources/cost/
      # @param [Hash] optional parameters
      # @return [Array] array of Hashie::Mashes
      # @example running a report
      #   .run_cost_report(start_date: '2013-09-02', end_date: '2013-09-09',
      #     dimensions: 'linked_account_name', metrics: 'invoiced_cost')
      def run_cost_report(options={})
        response = get '/1/reporting/cost/run', options
        convert_to_mashes response
      end

      # List measures recognized by the server
      #
      # @see http://developers.cloudability.com/resources/cost/
      # @return [Array] array of Hashie::Mashes
      def cost_measures
        response = get '/1/reporting/cost/measures'
        convert_to_mashes response
      end

      # List available filters for requesting data
      #
      # @see http://developers.cloudability.com/resources/cost/
      # @return [Array] array of filters as strings
      def cost_filters
        get('/1/reporting/cost/filters').to_a
      end
      
    end
  end
end