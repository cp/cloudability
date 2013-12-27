require 'spec_helper'

describe Cloudability::Client::UsageReports do

  before do
    @client = Cloudability::Client.new(auth_token: 'token')
  end

  describe '#cost_reports' do
    it 'should be an array' do
      stub_get('/1/reporting/cost?auth_token=token', 'cost/reports')
      @client.cost_reports.should be_kind_of Array
    end

    it 'should be an array of Hashie::Mashes' do
      stub_get('/1/reporting/cost?auth_token=token', 'cost/reports')
      @client.cost_reports.each{|report| report.should be_kind_of Hashie::Mash }
    end
  end

  describe '#usage_measures' do
    it 'should be an array' do
      stub_get('/1/reporting/measures?auth_token=token', 'cost/measures')
      @client.usage_measures.should be_kind_of Array
    end

    it 'should be an array of Hashie::Mashes' do
      stub_get('/1/reporting/measures?auth_token=token', 'cost/measures')
      @client.usage_measures.each{|measure| measure.should be_kind_of Hashie::Mash }
    end
  end

  describe '#usage_filters' do
    it 'should be an array' do
      stub_get('/1/reporting/filters?auth_token=token', 'usage/filters')
      @client.usage_filters.should be_kind_of Array
    end

    it 'should be an array of strings' do
      stub_get('/1/reporting/filters?auth_token=token', 'usage/filters')
      @client.usage_filters.each{|filter| filter.should be_kind_of String }
    end
  end
end