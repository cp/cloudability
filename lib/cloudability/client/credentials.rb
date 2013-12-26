module Cloudability
  class Client
    module Credentials

      def credentials
        response = get("/0/credentials/index")
        convert_to_mashes(response)
      end

    end
  end
end