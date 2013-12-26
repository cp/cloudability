require 'spec_helper'

describe Cloudability::Client::Organizations do

  before do
    @client = Cloudability::Client.new(auth_token: 'token')
  end
  
  describe '#my_organization' do
    it 'should be a Hashie::Mashe' do
      stub_get('/1/organizations?auth_token=token', 'organization')
      @client.my_organization.class.should == Hashie::Mash
    end
  end

  describe '#organization_invitations' do
    it 'should be an Array' do
      stub_get('/1/organizations/invitations?auth_token=token', 'organization_invitations')
      @client.organization_invitations.class.should == Array
    end

    it 'should be an array of Hashie::Mashes' do
      stub_get('/1/organizations/invitations?auth_token=token', 'organization_invitations')
      @client.organization_invitations.each{|invite| invite.class.should == Hashie::Mash }
    end
  end

  describe '#organization_roles' do
    it 'should be an Array' do
      stub_get('/1/organizations/roles?auth_token=token', 'organization_roles')
      @client.organization_roles.class.should == Array
    end

    it 'should be an array of Hashie::Mashes' do
      stub_get('/1/organizations/roles?auth_token=token', 'organization_roles')
      @client.organization_roles.each{|role| role.class.should == Hashie::Mash }
    end
  end

  describe '#invite_user' do
    it 'should be a Hashie::Mash' do
      stub_post('/1/organizations/invitations?auth_token=token&email=colbyaleyrb%40gmail.com', 'organization_invitation')
      @client.invite_user('colbyaleyrb@gmail.com').class.should == Hashie::Mash
    end

    it 'should accept a hash with email and name' do
      stub_post('/1/organizations/invitations?auth_token=token&email=colbyaleyrb%40gmail.com&name=colby', 'organization_invitation')
      expect { @client.invite_user('colbyaleyrb@gmail.com', name: 'colby') }.not_to raise_exception
    end
  end
end