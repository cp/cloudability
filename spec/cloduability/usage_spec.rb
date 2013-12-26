require 'spec_helper'

describe Cloudability::Client::UsageReports do

  before do
    @client = Cloudability::Client.new(auth_token: 'token')
  end

  describe '#cost_reports' do
    it 'should be an array' do
      stub_get('/1/reporting/cost?auth_token=token', 'cost/reports')
      @client.cost_reports.class.should == Array
    end

    it 'should be an array of Hashie::Mashes' do
      stub_get('/1/reporting/cost?auth_token=token', 'cost/reports')
      @client.cost_reports.each{|report| report.class.should == Hashie::Mash }
    end
  end

  # describe '#run_cost_report' do
  #   it 'should be an array' do
  #     stub_get('/1/billing_reports?auth_token=token', 'billing_reports')
  #     @client.billing_report.class.should == Array
  #   end

  #   it 'should be an array of Hashie::Mashes' do
  #     stub_get('/1/billing_reports?auth_token=token', 'billing_reports')
  #     @client.billing_report.each{|report| report.class.should == Hashie::Mash }
  #   end

  #   it 'should return results given by service, given the vendor and period' do
  #     stub_get('/1/reporting/cost/run?&start_date=2013-09-02&end_date=2013-09-09&dimensions=linked_account_name&metrics=invoiced_cost', 'billing_reports')
  #     expect { @client.run_cost_report(start_date: '2013-09-02', end_date: '2013-09-09', dimensions: 'linked_account_name', metrics: 'invoiced_cost')) }.not_to raise_exception
  #   end
  # end

  describe '#usage_measures' do
    it 'should be an array' do
      stub_get('/1/reporting/measures?auth_token=token', 'cost/measures')
      @client.usage_measures.class.should == Array
    end

    it 'should be an array of Hashie::Mashes' do
      stub_get('/1/reporting/measures?auth_token=token', 'cost/measures')
      @client.usage_measures.each{|measure| measure.class.should == Hashie::Mash }
    end
  end

  describe '#usage_filters' do
    it 'should be an array' do
      stub_get('/1/reporting/filters?auth_token=token', 'usage/filters')
      @client.usage_filters.class.should == Array
    end

    it 'should be an array of strings' do
      stub_get('/1/reporting/filters?auth_token=token', 'usage/filters')
      @client.usage_filters.each{|filter| filter.class.should == String }
    end
  end
end