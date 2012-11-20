require_relative '../../helper'

class TestCloudability < Test::Unit::TestCase
  context "Credentials :: Hitting the Cloudability Credentials API" do
    setup do
      @auth_token = 'xxxxxxxxxxxxxxxxxxxx'
      @credentials = Cloudability::Credentials.new(:auth_token => @auth_token)

      # The budget API endpoint
      @default_uri = "https://app.cloudability.com/api/0/credentials/index?auth_token=#{@auth_token}"
      @default_fixture = "credentials.json"
    end

    should "return all credentials in an Array of Mashes" do
      stub_get @default_uri, @default_fixture
      all_credentials = @credentials.find_all
      all_credentials.class.should ==  Array
      all_credentials.each { |c| c.class.should ==  Mash }
    end
  end
end
