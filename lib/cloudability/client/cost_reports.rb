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