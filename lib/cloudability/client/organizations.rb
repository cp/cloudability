module Cloudability
  class Client
    module Organizations

      # Get information about the authenticted user's organization
      # NOTE: This requires that you are the organization admin.
      # 
      # @return [Hashie::Mash]
      def my_organization
        request = get '/1/organizations'
        Hashie::Mash.new request
      end
      alias :organization :my_organization

      # List all invitations to the authenticated user's organization
      #
      # @see http://developers.cloudability.com/resources/organizations/invitations/
      # @return [Array] array of Hashie::Mashes
      def organization_invitations
        request = get '/1/organizations/invitations'
        convert_to_mashes request
      end
      alias :invitations :organization_invitations

      # Retrieve your organizations roles.
      #
      # @return [Array] array of Hashie::Mashes
      def organization_roles
        request = get '/1/organizations/roles'
        convert_to_mashes request
      end
      alias :roles :organization_roles

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
      alias :invite :invite_user

    end
  end
end