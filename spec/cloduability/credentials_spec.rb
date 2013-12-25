require 'spec_helper'

describe Cloudability::Credentials do
  describe '#initialize' do
    it 'should raise ArgumentError when auth_token is not provided' do
      expect { Cloudability::Credentials.new }.to raise_exception(ArgumentError)
    end

    it 'should not raise any exception when auth token is provided' do
      expect { Cloudability::Credentials.new(auth_token: 'token') }.not_to raise_exception
    end
  end

  before do
    @cloudability = Cloudability::Credentials.new(auth_token: 'token')
  end
  
  describe '#find_all' do
    it 'should be an array' do
      stub_get('/0/credentials/index?auth_token=token', 'credentials')
      @cloudability.find_all.class.should == Array
    end

    it 'should be an array of Hashie::Mashes' do
      stub_get('/0/credentials/index?auth_token=token', 'credentials')
      @cloudability.find_all.each{|credential| credential.class.should == Hashie::Mash }
    end
  end
end