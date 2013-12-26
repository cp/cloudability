module Cloudability
  class Client
    module Organizations

      def my_organization
        request = get '/1/organizations'
        Hashie::Mash.new request
      end

      def organization_invitations
        request = get '/1/organizations/invitations'
        convert_to_mashes request
      end

      def organization_roles
        request = get '/1/organizations/roles'
        convert_to_mashes request
      end

      # Create a new invitation to the authenticated user's organization
      #
      # @see http://developers.cloudability.com/resources/organizations/invitations/
      # @param [String] email to send invitation to
      # @param [Hash] args to pass to HTTParty
      #   @option [String] name
      #   @option [String] role_id
      def invite_user(email, options={})
        options[:email] = email

        request = post '/1/organizations/invitations', options
        Hashie::Mash.new request
      end

    end
  end
end