module Cloudability
  class Client
    module Credentials

      # Get information about your configured credentials
      #
      # @return [Array] array of Hashie::Mashes
      def credentials
        request = get '/0/credentials/index'
        convert_to_mashes request
      end

    end
  end
end
