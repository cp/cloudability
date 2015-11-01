require 'spec_helper'

describe Cloudability::Client::BillingReports do
  let(:client) { Cloudability::Client.new(auth_token: 'token') }

  describe '#billing_reports' do
    it 'should be an array' do
      stub_get('/1/billing_reports?auth_token=token', 'billing_reports')
      client.billing_report.should be_kind_of Array
    end

    it 'should be an array of Hashie::Mashes' do
      stub_get('/1/billing_reports?auth_token=token', 'billing_reports')
      client.billing_report.each{|report| report.should be_kind_of Hashie::Mash }
    end

    it 'should have a currency attrubute on every element' do
      stub_get('/1/billing_reports?auth_token=token', 'billing_reports')
      client.billing_report.each{|report| report.currency.should_not be_nil }
    end

    it 'should return results by service' do
      stub_get('/1/billing_reports?auth_token=token&by=service', 'billing_reports')
      expect { client.billing_report(by: 'service') }.not_to raise_exception
    end

    it 'should return results given by service, given the vendor and period' do
      stub_get('/1/billing_reports?auth_token=token&by=service&vendor=Amazon&period=2012-03-01', 'billing_reports')
      expect { client.billing_report(by: 'service', vendor: 'Amazon', period: '2012-03-01') }.not_to raise_exception
    end
  end
end