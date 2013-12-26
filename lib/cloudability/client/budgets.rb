module Cloudability
  class Client
    module Budgets

      # Retrieve information about your budgets
      #
      # @return [Array] array of Hashie::Mashes
      def budgets
        request = get '/1/budgets/index'
        convert_to_mashes(request)
      end
    end
  end
end