require 'spec_helper'

describe Cloudability::Client::ReservedInstances do
  let(:client) { Cloudability::Client.new(auth_token: 'token') }

  describe '#ri_recommendations' do
    it 'should be an array' do
      stub_get('/1/reserved_instances/recommendations?auth_token=token',
        'reserved_instances/recommendations')
      client.ri_recommendations.should be_kind_of Array
    end

    it 'should be an array of Hashie::Mashes' do
      stub_get('/1/reserved_instances/recommendations?auth_token=token',
        'reserved_instances/recommendations')
      client.ri_recommendations.each{|rec| rec.should be_kind_of Hashie::Mash }
    end
  end
end
