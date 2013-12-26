require 'rubygems'
require 'coveralls'
# Coveralls.wear!
require 'bundler'
require 'fakeweb'
require 'cloudability'

# Borrowed this Fixtures/Fakeweb implimentation
# fromt the gauges-gem library.
# https://github.com/fastestforward/gauges-gem
# https://github.com/fastestforward/gauges-gem/blob/master/spec/helper.rb

BASE_URI = 'https://app.cloudability.com/api'

module FakeRequestHelpers
  def fixture(name)
    path = File.expand_path("../fixtures/#{name}", __FILE__)
    File.open(path).read
  end

  def stub_get(url, name)
    FakeWeb.register_uri(:get, BASE_URI + url, :response => fixture(name))
  end

  def stub_post(url, name)
    FakeWeb.register_uri(:post, BASE_URI + url, :response => fixture(name))
  end

  def stub_put(url, name)
    FakeWeb.register_uri(:put, BASE_URI + url, :response => fixture(name))
  end

  def stub_delete(url, name)
    FakeWeb.register_uri(:delete, BASE_URI + url, :response => fixture(name))
  end
end

RSpec.configure do |c|
  c.include(FakeRequestHelpers)

  c.before(:each) do
    FakeWeb.clean_registry
  end
end

FakeWeb.allow_net_connect = false
FakeWeb.allow_net_connect = %r[^https?://coveralls.io/api/v1/jobs]

# Creating fixtures:
# curl -is https://app.cloudability.com/api/0/billing_reports?auth_token=token&by=account > spec/fixtures/billing_report