require 'spec_helper'

describe Cloudability::Client::Budgets do

  before do
    @client = Cloudability::Client.new(auth_token: 'token')
  end

  describe '#budgets' do
    it 'should be an array' do
      stub_get('/1/budgets/index?auth_token=token', 'budgets')
      @client.budgets.should be_kind_of Array
    end

    it 'should be an array of Hashie::Mashes' do
      stub_get('/1/budgets/index?auth_token=token', 'budgets')
      @client.budgets.each{|budget| budget.should be_kind_of Hashie::Mash }
    end

    it 'should be mappable by ID' do
      stub_get('/1/budgets/index?auth_token=token', 'budgets')
      @client.budgets.map(&:id).should be_kind_of Array
    end

    it 'should be mappable by ID and not be empty' do
      stub_get('/1/budgets/index?auth_token=token', 'budgets')
      @client.budgets.map(&:id).should_not be_empty
    end
  end
end