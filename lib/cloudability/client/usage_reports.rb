module Cloudability
  class Client
    module UsageReports

      # List current usage reports.
      #
      # @see http://developers.cloudability.com/resources/usage/
      # @return [Array] array of Hashie::Mashes
      def usage_reports
        request = get '/1/reporting'
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