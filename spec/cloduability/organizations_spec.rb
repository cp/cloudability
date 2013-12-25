require 'spec_helper'

describe Cloudability::Organizations do
  describe '#initialize' do
    it 'should raise ArgumentError when auth_token is not provided' do
      expect { Cloudability::Organizations.new }.to raise_exception(ArgumentError)
    end

    it 'should not raise any exception when auth token is provided' do
      expect { Cloudability::Organizations.new(auth_token: 'token') }.not_to raise_exception
    end
  end

  before do
    @cloudability = Cloudability::Organizations.new(auth_token: 'token')
  end
  
  describe '#my_organization' do
    it 'should be a Hashie::Mashe' do
      stub_get('/1/organizations?auth_token=token', 'organization')
      @cloudability.my_organization.class.should == Hashie::Mash
    end
  end
end