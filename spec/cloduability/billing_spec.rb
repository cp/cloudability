require 'spec_helper'

describe Cloudability::Billing do
  describe '#initialize' do
    it 'should raise ArgumentError when auth_token is not provided' do
      expect { Cloudability::Billing.new }.to raise_exception(ArgumentError)
    end

    it 'should not raise any exception when auth token is provided' do
      expect { Cloudability::Billing.new(auth_token: 'token') }.not_to raise_exception
    end
  end

  before do
    @cloudability = Cloudability::Billing.new(auth_token: 'token')
  end
  
  describe '#report_by' do
    it 'should raise an ArgumentError when no dimension is passed' do
      expect { @cloudability.report_by }.to raise_exception(ArgumentError)
    end

    it 'should raise an ArgumentError when unknown dimension is passed' do
      expect { @cloudability.report_by(:coolness) }.to raise_exception(ArgumentError)
    end

    it 'should be an array' do
      stub_get('/0/billing_reports?auth_token=token&by=account', 'report_by_account')
      @cloudability.report_by(:account).class.should == Array
    end

    it 'should be an array of Hashie::Mashes' do
      stub_get('/0/billing_reports?auth_token=token&by=account', 'report_by_account')
      @cloudability.report_by(:account).each{|report| report.class.should == Hashie::Mash }
    end
  end

  describe '#filter_by_period' do
    it 'should get a report given a period' do
      stub_get('/0/billing_reports?auth_token=token&period=13-08-05', 'report_by_period')
      expect { @cloudability.filter_by_period('13-08-05') }.not_to raise_exception
    end

    it 'should be a Hashie::Mash' do
      stub_get('/0/billing_reports?auth_token=token&period=13-08-05', 'report_by_period')
      @cloudability.filter_by_period('13-08-05').class.should == Hashie::Mash
    end

    it 'should raise an ArgumentError when an invalid date is provided' do
      expect { @cloudability.filter_by_period('1343-08-05') }.to raise_exception(ArgumentError)
    end
  end
end