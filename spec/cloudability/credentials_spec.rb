require 'spec_helper'

describe Cloudability::Client::Credentials do
  let(:client) { Cloudability::Client.new(auth_token: 'token') }

  describe '#credentials' do
    it 'should be an array' do
      stub_get('/0/credentials/index?auth_token=token', 'credentials')
      client.credentials.should be_kind_of Array
    end

    it 'should be an array of Hashie::Mashes' do
      stub_get('/0/credentials/index?auth_token=token', 'credentials')
      client.credentials.each{|report| report.should be_kind_of Hashie::Mash }
    end
  end
end