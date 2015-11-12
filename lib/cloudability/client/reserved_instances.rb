module Cloudability
  class Client
    module ReservedInstances

      # Get Recommendations
      #
      # @param [Hash] optional parameters
      #   @option [String] start_date
      #   @option [String] end_date
      #   @option [String] reservation_length
      def ri_recommendations(options={})
        request = get '/1/reserved_instances/recommendations', options
        convert_to_mashes request
      end

      # Get Instance Count Histogram
      #
      # @param [String] availability_zone
      # @param [String] platform
      # @param [String] instance_size
      # @param [Hash] optional parameters
      #   @option start_at
      #   @option end_at
      def ri_histogram(az, platform, size, options={})
        options[:az] = az
        options[:platform] = platform
        options[:size] = size

        request = get '/1/reporting/histogram', options
        Hashie::Mash.new request
      end
    end
  end
end
