require 'spec_helper'

describe Cloudability::Client::CostReports do

  before do
    @client = Cloudability::Client.new(auth_token: 'token')
  end

  describe '#cost_reports' do
    it 'should be an array' do
      stub_get('/1/reporting/cost?auth_token=token', 'cost/reports')
      @client.cost_reports.should be_kind_of Array
    end

    it 'should be mappable by ID' do
      stub_get('/1/reporting/cost?auth_token=token', 'cost/reports')
      @client.cost_reports.map(&:id).should be_kind_of Array
    end

    it 'should be mappable by ID and not be empty' do
      stub_get('/1/reporting/cost?auth_token=token', 'cost/reports')
      @client.cost_reports.map(&:id).should_not be_empty
    end

    it 'should be mappable by category and not be empty' do
      stub_get('/1/reporting/cost?auth_token=token', 'cost/reports')
      @client.cost_reports.map(&:category).should_not be_empty
    end

    it 'should be an array of Hashie::Mashes' do
      stub_get('/1/reporting/cost?auth_token=token', 'cost/reports')
      @client.cost_reports.each{|report| report.should be_kind_of Hashie::Mash }
    end
  end

  describe '#cost_measures' do
    it 'should be an array' do
      stub_get('/1/reporting/cost/measures?auth_token=token', 'cost/measures')
      @client.cost_measures.should be_kind_of Array
    end

    it 'should be mappable by type' do
      stub_get('/1/reporting/cost/measures?auth_token=token', 'cost/measures')
      @client.cost_measures.map(&:type).should be_kind_of Array
    end

    it 'should be mappable by type and not be empty' do
      stub_get('/1/reporting/cost/measures?auth_token=token', 'cost/measures')
      @client.cost_measures.map(&:type).should_not be_empty
    end

    it 'should be an array of Hashie::Mashes' do
      stub_get('/1/reporting/cost/measures?auth_token=token', 'cost/measures')
      @client.cost_measures.each{|measure| measure.should be_kind_of Hashie::Mash }
    end
  end

  describe '#cost_filters' do
    it 'should be an array' do
      stub_get('/1/reporting/cost/filters?auth_token=token', 'cost/filters')
      @client.cost_filters.should be_kind_of Array
    end

    it 'should not be an empty array' do
      stub_get('/1/reporting/cost/filters?auth_token=token', 'cost/filters')
      @client.cost_filters.should_not be_empty
    end

    it 'should not be an empty array' do
      stub_get('/1/reporting/cost/filters?auth_token=token', 'cost/filters')
      @client.cost_filters.should_not be_empty
    end

    it 'should be an array of strings' do
      stub_get('/1/reporting/cost/filters?auth_token=token', 'cost/filters')
      @client.cost_filters.each{|filter| filter.should be_kind_of String }
    end
  end
end