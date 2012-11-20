require_relative '../../helper'

class TestCloudability < Test::Unit::TestCase
  context "Billing :: Hitting the Cloudability Billing API" do
    setup do
      @auth_token = 'xxxxxxxxxxxxxxxxxxxx'
      @report = Cloudability::Billing.new(:auth_token => @auth_token)

      # The billing API endpoint
      @billing_uri = "https://app.cloudability.com/api/0/billing_reports?auth_token=#{@auth_token}"
      @default_fixture = "billing_report_period.json"
    end

    # Filter by TODO :: 
    # - <filter>= : vendor, service, credential, account
    # - combine filters
    should "return a single period Mash containing spending" do
      period = "2012-11-01"
      uri = "#{@billing_uri}&period=#{period}"

      stub_get uri, @default_fixture
      single_period = @report.filter_by_period(period)
      single_period.period.should == period
      single_period.spend.should == "4987.99"
    end

    # Report by TODO :: 
    # - by= : service, credential, account
    # - combine filters

    should "report by period" do
      uri = "#{@billing_uri}&by=period"
      stub_get uri, "billing_report_year.json"
      
      billing_report = @report.report_by(:period)
      
      billing_report.count.should == 13
      billing_report.first.period.should == "2011-11-01"
      billing_report.last.period.should == "2012-11-01"
      billing_report.last.spend.should == "4987.99"
    end

    should "report by vendor" do
      uri = "#{@billing_uri}&by=vendor"
      stub_get uri, "billing_report_by-vendor.json"
      
      billing_report = @report.report_by(:vendor)
      
      billing_report.count.should == 1
      billing_report.first.vendor_name.should == "Amazon"
      billing_report.last.spend.should == "100000.99"
    end

  end
end
