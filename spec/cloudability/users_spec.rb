require 'spec_helper'

describe Cloudability::Client::Users do
  let(:client) { Cloudability::Client.new(auth_token: 'token') }

  describe '#users' do
    it 'should return an array' do
      stub_get('/1/users?auth_token=token', 'users/users')
      client.users.should be_kind_of Array
    end

    it 'should return an array of Hashie::Mashes' do
      stub_get('/1/users?auth_token=token', 'users/users')
      client.users.each{|user| user.should be_kind_of Hashie::Mash }
    end
  end

  describe '#add_user' do
    it 'should return a Hashie::Mash' do
      stub_post('/1/users?user[email]=colbyaley%40gmail.com&auth_token=token', 'users/add_user')
      client.add_user('colbyaley@gmail.com').should be_kind_of Hashie::Mash
    end
  end

  describe '#update_user' do
    it 'should return a Hashie::Mash' do
      stub_put('/1/users/23052?user[full_name]=Colby%20Aley&auth_token=token', 'users/update_user')
      client.update_user('23052', full_name: 'Colby Aley').should be_kind_of Hashie::Mash
    end
  end

  describe '#delete_user' do
    it 'should return "true"' do
      stub_delete('/1/users/23052?auth_token=token', 'users/delete_user')
      client.delete_user('23052').body.should eq("true")
    end
  end
end
