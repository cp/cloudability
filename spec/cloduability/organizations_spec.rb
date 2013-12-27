require 'spec_helper'

describe Cloudability::Client::Organizations do

  before do
    @client = Cloudability::Client.new(auth_token: 'token')
  end
  
  describe '#my_organization' do
    it 'should be a Hashie::Mashe' do
      stub_get('/1/organizations?auth_token=token', 'organization')
      @client.my_organization.should be_kind_of Hashie::Mash
    end
  end

  describe '#organization_invitations' do
    it 'should be an Array' do
      stub_get('/1/organizations/invitations?auth_token=token', 'organization_invitations')
      @client.organization_invitations.should be_kind_of Array
    end

    it 'should be an array of Hashie::Mashes' do
      stub_get('/1/organizations/invitations?auth_token=token', 'organization_invitations')
      @client.organization_invitations.each{|invite| invite.should be_kind_of Hashie::Mash }
    end

    it 'should be mappable by ID' do
      stub_get('/1/organizations/invitations?auth_token=token', 'organization_invitations')
      @client.organization_invitations.map(&:id).should be_kind_of Array
    end

      it 'should be mappable by ID and not be empty' do
      stub_get('/1/organizations/invitations?auth_token=token', 'organization_invitations')
      @client.organization_invitations.map(&:id).should_not be_empty
    end
  end

  describe '#organization_roles' do
    it 'should be an Array' do
      stub_get('/1/organizations/roles?auth_token=token', 'organization_roles')
      @client.organization_roles.should be_kind_of Array
    end

    it 'should be an array of Hashie::Mashes' do
      stub_get('/1/organizations/roles?auth_token=token', 'organization_roles')
      @client.organization_roles.each{|role| role.should be_kind_of Hashie::Mash }
    end
  end

  describe '#invite_user' do
    it 'should be a Hashie::Mash' do
      stub_post('/1/organizations/invitations?auth_token=token&email=colbyaleyrb%40gmail.com', 'organization_invitation')
      @client.invite_user('colbyaleyrb@gmail.com').should be_kind_of Hashie::Mash
    end

    it 'should accept a hash with email and name' do
      stub_post('/1/organizations/invitations?auth_token=token&email=colbyaleyrb%40gmail.com&name=colby', 'organization_invitation')
      expect { @client.invite_user('colbyaleyrb@gmail.com', name: 'colby') }.not_to raise_exception
    end
  end

  describe '#delete_invite' do
    it 'should should not raise an exception when id is provided' do
      stub_delete('/1/organizations/invitations/1?auth_token=token', 'organization_invitation')
      expect { @client.delete_invite(1) }.not_to raise_exception
    end

    it 'should require id as an argument' do
      expect { @client.delete_invite }.to raise_exception(ArgumentError)
    end
  end

  describe '#update_invite' do
    it 'should should not raise an exception when id and role_id are provided' do
      stub_put('/1/organizations/invitations/1?role_id=1&auth_token=token', 'organization_invitation')
      expect { @client.update_invite(1,1) }.not_to raise_exception
    end

    it 'should require id and role_id as arguments' do
      expect { @client.update_invite }.to raise_exception(ArgumentError)
    end
  end
end