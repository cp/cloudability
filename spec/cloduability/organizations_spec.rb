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

  describe '#invitations' do
    it 'should be an Array' do
      stub_get('/1/organizations/invitations?auth_token=token', 'organization_invitations')
      @cloudability.invitations.class.should == Array
    end

    it 'should be an array of Hashie::Mashes' do
      stub_get('/1/organizations/invitations?auth_token=token', 'organization_invitations')
      @cloudability.invitations.each{|invite| invite.class.should == Hashie::Mash }
    end
  end

  describe '#invite_user' do
    it 'should be a Hashie::Mash' do
      stub_post('/1/organizations/invitations?auth_token=token&email=colbyaleyrb%40gmail.com', 'organization_invitation')
      @cloudability.invite_user(email: 'colbyaleyrb@gmail.com').class.should == Hashie::Mash
    end

    it 'should accept a hash with email and name' do
      stub_post('/1/organizations/invitations?auth_token=token&email=colbyaleyrb%40gmail.com&name=colby', 'organization_invitation')
      expect { @cloudability.invite_user(email: 'colbyaleyrb@gmail.com', name: 'colby') }.not_to raise_exception
    end

    it 'should not accept requests without an email' do
      expect { @cloudability.invite_user(name: 'Colby Aley') }.to raise_exception(ArgumentError)
    end
  end
end