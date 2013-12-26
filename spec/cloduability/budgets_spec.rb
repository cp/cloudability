require 'spec_helper'

describe Cloudability::Client::Budgets do

  before do
    @client = Cloudability::Client.new(auth_token: 'token')
  end

  describe '#budgets' do
    it 'should be an array' do
      stub_get('/1/budgets/index?auth_token=token', 'budgets')
      @client.budgets.class.should == Array
    end

    it 'should be an array of Hashie::Mashes' do
      stub_get('/1/budgets/index?auth_token=token', 'budgets')
      @client.budgets.each{|budget| budget.class.should == Hashie::Mash }
    end
  end
end