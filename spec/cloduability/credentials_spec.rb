require 'spec_helper'

describe Cloudability::Client::Credentials do

  before do
    @client = Cloudability::Client.new(auth_token: 'token')
  end

  describe '#credentials' do
    it 'should be an array' do
      stub_get('/0/credentials/index?auth_token=token', 'credentials')
      @client.credentials.class.should == Array
    end

    it 'should be an array of Hashie::Mashes' do
      stub_get('/0/credentials/index?auth_token=token', 'credentials')
      @client.credentials.each{|report| report.class.should == Hashie::Mash }
    end
  end
end