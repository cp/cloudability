require_relative '../../helper'

class TestCloudability < Test::Unit::TestCase
  context "Budgets :: Hitting the Cloudability Budgets API" do
    setup do
      @auth_token = 'xxxxxxxxxxxxxxxxxxxx'
      @budgets = Cloudability::Budgets.new(:auth_token => @auth_token)

      # The budget API endpoint
      @default_uri = "https://app.cloudability.com/api/1/budgets/index?auth_token=#{@auth_token}"
      @default_fixture = "budgets.json"
    end

    should "return all budgets in an Array of Mashes" do
      stub_get @default_uri, @default_fixture
      all_budgets = @budgets.find_all
      all_budgets.class.should ==  Array
      all_budgets.each { |b| b.class.should ==  Mash }
    end

    should "return a single budget Mash when calling find with an id" do
      stub_get @default_uri, @default_fixture
      single_budget = @budgets.find_by_id(1234)
      single_budget.subject.should == "1234-5678-90A"
    end

    should "return a single budget Mash when calling find with a subject" do
      stub_get @default_uri, @default_fixture
      single_budget = @budgets.find_by_subject("1234-5678-90A")
      single_budget.id.should == 1234
    end

    should "return a single budget Mash when calling find with a key" do
      stub_get @default_uri, @default_fixture

      single_budget = @budgets.find_by_key({ :key => :id, :value => 1234 })
      single_budget.subject.should == "1234-5678-90A"

      single_budget = @budgets.find_by_key({ :key => :subject, :value => "1234-5678-90A" })
      single_budget.id.should == 1234
    end

  end
end