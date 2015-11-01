module Cloudability
  class Client
    module Users
      # Documentation: http://developers.cloudability.com/resources/users/

      # List users in your organization.
      #
      # @return [Array] array of Hashie::Mashes
      def users
        request = get '/1/users'
        convert_to_mashes(request)
      end

      # Add a user to your organization
      #
      # @param [String] email of user
      # @param [Hash] options
      #   @option [String] full_name
      #   @option [String] role
      #   @option [Boolean] restricted
      #   @option [Array] new_shared_dimension_filter_set_ids
      #   @option [Integer] default_dimension_filter_set_id
      # @return [Array] array of Hashie::Mashes
      def add_user(email, options={})
        options[:email] = email

        payload = {user: options}
        request = post '/1/users', payload
        Hashie::Mash.new request
      end

      # Update a user in your organization
      #
      # @param [Integer] ID of user
      # @param [Hash] options
      #   @option [String] full_name
      #   @option [String] role
      #   @option [Boolean] restricted
      #   @option [Array] new_shared_dimension_filter_set_ids
      #   @option [Integer] default_dimension_filter_set_id
      # @return [Array] array of Hashie::Mashes
      def update_user(id, options={})
        payload = {user: options}
        request = put "/1/users/#{id}", payload
        Hashie::Mash.new request
      end

      # Delete a user in your organization
      #
      # @param [Integer] ID of user
      # @return [Boolean] success
      def delete_user(id)
        delete "/1/users/#{id}"
      end
    end
  end
end
