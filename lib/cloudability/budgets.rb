module Cloudability
  class Budgets
    include HTTParty
    base_uri "https://app.cloudability.com/api/1"
    format :json

    attr_accessor :auth_token

    def initialize(options={})
      @auth_token = options[:auth_token]
    end

    # Return all the budgets for the current account, and return as mash's.
    def find_all
      convert_to_mashes(get_budgets)
    end

    # Find a particular budget, based on its id, and return a mash.
    def find_by_id(id)
      all_budgets = find_all
      budget = all_budgets.select {|r| r.id == id}.first
    end

    # Find a particular budget, based on its subject, and return a mash.
    def find_by_subject(subject)
      all_budgets = find_all
      budget = all_budgets.select {|r| r.subject == subject}.first
    end

    # Find a particular budget, based on a key, and return a mash.
    def find_by_key(options={})
      case options[:key]
      when :id
        budget = find_by_id(options[:value])
      when :subject
        budget = find_by_subject(options[:value])
      end
    end

    private

    def get_budgets
      response = self.class.get("/budgets/index?auth_token=#{self.auth_token}")
      response.success? ? response : raise(response.response)
    end

    # Convert the json into an Array of Mashes.
    def convert_to_mashes(response)
      budgets =[]
      response.each { |b| budgets << Mash.new(b)}
      return budgets
    end

  end
end
