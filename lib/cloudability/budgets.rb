module Cloudability
  class Budgets
    include HTTParty
    base_uri "https://app.cloudability.com/api/1"
    format :json

    attr_accessor :auth_token

    def initialize(options={})
      raise ArgumentError, "You must provide an auth token" if options[:auth_token].nil?
      @auth_token = options[:auth_token]
    end

    # Return all the budgets for the current account, and return as mash's.
    def find_all
      convert_to_mashes(get_budgets)
    end

    # Find a particular budget, based on its id, and return a mash.
    def find_by_id(id)
      find_all.select {|b| b.id == id}.first
    end

    # Find a particular budget, based on its subject, and return a mash.
    def find_by_subject(subject)
      unless subject.length == 14
        raise ArgumentError, "You must provide a valid subject such as 1234-5678-9101."
      end
      
      find_all.select {|b| b.subject == subject}.first
    end

    # Find a particular budget, based on a key, and return a mash.
    def find_by_key(options={})
      case options[:key]
      when :id
        budget = find_by_id(options[:value])
      when :subject
        budget = find_by_subject(options[:value])
      else
        raise ArgumentError, "You must provide a valid key."
      end
    end

    private

    def get_budgets
      response = self.class.get("/budgets/index?auth_token=#{@auth_token}")
      response.success? ? response : raise(response.response)
    end

    # Convert the json into an Array of Mashes.
    def convert_to_mashes(response)
      response.map { |budget| Hashie::Mash.new(budget) }
    end

  end
end