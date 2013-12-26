require 'spec_helper'

describe Cloudability::Client::BillingReports do

  before do
    @client = Cloudability::Client.new(auth_token: 'token')
  end

  describe '#billing_reports' do
    it 'should be an array' do
      stub_get('/1/billing_reports?auth_token=token', 'billing_reports')
      @client.billing_report.class.should == Array
    end

    it 'should be an array of Hashie::Mashes' do
      stub_get('/1/billing_reports?auth_token=token', 'billing_reports')
      @client.billing_report.each{|report| report.class.should == Hashie::Mash }
    end

    it 'should return results given by service, given the vendor and period' do
      stub_get('/1/billing_reports?auth_token=token&by=service&vendor=Amazon&period=2012-03-01', 'billing_reports')
      expect { @client.billing_report(by: 'service', vendor: 'Amazon', period: '2012-03-01') }.not_to raise_exception
    end
  end
end