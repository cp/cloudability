require 'spec_helper'

describe Cloudability::Budgets do
  describe '#initialize' do
    it 'should raise ArgumentError when auth_token is not provided' do
      expect { Cloudability::Budgets.new }.to raise_exception(ArgumentError)
    end

    it 'should not raise any exception when auth token is provided' do
      expect { Cloudability::Budgets.new(auth_token: 'token') }.not_to raise_exception
    end
  end

  before do
    @cloudability = Cloudability::Budgets.new(auth_token: 'token')
  end
  
  describe '#find_all' do
    it 'should be an array' do
      stub_get('/1/budgets/index?auth_token=token', 'all_budgets')
      @cloudability.find_all.class.should == Array
    end

    it 'should be an array of Hashie::Mashes' do
      stub_get('/1/budgets/index?auth_token=token', 'all_budgets')
      @cloudability.find_all.each{|budget| budget.class.should == Hashie::Mash }
    end
  end

  describe '#find_by_id' do
    it 'should be a Hashie::Mash' do
      stub_get('/1/budgets/index?auth_token=token', 'all_budgets')
      @cloudability.find_by_id(2039).class.should == Hashie::Mash
    end

    it 'should accept a string as an argument' do
      stub_get('/1/budgets/index?auth_token=token', 'all_budgets')
      expect { @cloudability.find_by_id('2039') }.not_to raise_exception
    end 
  end

  describe '#find_by_subject' do
    it 'should be a Hashie::Mash' do
      stub_get('/1/budgets/index?auth_token=token', 'all_budgets')
      @cloudability.find_by_subject('1111-1111-1111').class.should == Hashie::Mash
    end

    it 'should raise an ArgumentError when you give it a non valid key' do
      stub_get('/1/budgets/index?auth_token=token', 'all_budgets')
      expect { @cloudability.find_by_subject('1111-111-1111') }.to raise_exception(ArgumentError)
    end
  end

  describe '#find_by_key' do
    it 'should find a budget given a key value pair' do
      stub_get('/1/budgets/index?auth_token=token', 'all_budgets')
      @cloudability.find_by_key(key: :id, value: 2039).class.should == Hashie::Mash
    end

    it 'should raise an ArgumentError when you give it a weirdass key' do
      stub_get('/1/budgets/index?auth_token=token', 'all_budgets')
      expect { @cloudability.find_by_key(key: :hipsterness, value: 2039) }.to raise_exception(ArgumentError)
    end
  end
end