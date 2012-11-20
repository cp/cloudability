require_relative "cloudability/version"
require 'httparty'
require 'mash'

module Cloudability
  Dir[File.dirname(__FILE__) + '/cloudability/*.rb'].each do |file|
    require file
  end
end
