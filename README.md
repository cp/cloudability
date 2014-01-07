Cloudability
===

[![Build Status](https://travis-ci.org/ColbyAley/cloudability.png?branch=master)](https://travis-ci.org/ColbyAley/cloudability)
[![Code Climate](https://codeclimate.com/github/ColbyAley/cloudability.png)](https://codeclimate.com/github/ColbyAley/cloudability)
[![Coverage Status](https://coveralls.io/repos/ColbyAley/cloudability/badge.png)](https://coveralls.io/r/ColbyAley/cloudability)
[![Gem Version](https://badge.fury.io/rb/cloudability.png)](http://badge.fury.io/rb/cloudability)

Ruby wrapper for the [Cloudability API](http://developers.cloudability.com/). Supports most of the public API endpoints, including some legacy ones such as bugets. Converts JSON responses to objects with Hashie::Mash.

This is the README for version 0.1.0 of the gem. v0.1.0 introduces a radically different interface. If you're still on v0.0.5, please refer to it's [README](https://github.com/ColbyAley/cloudability/tree/v0.0.5).

## Installation

Add this line to your application's Gemfile:

    gem 'cloudability'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cloudability

## Usage

  Supported endpoints:

  * Credentials
  * Organizations (Including invitations and roles.)
  * Budgets
  * Billing Reports
  * Cost Reporrts
  * Usage Reports

You will need to generate an API token to use the API. Read more [here](https://support.cloudability.com/hc/en-us/articles/200311933-API-Setup-and-Documentation).

Feel free to shoot me an email at colby@cloudability.com if you have any questions or need help.
  
### Examples

    @client = Cloudability::Client.new(auth_token: 'auth_token')

#### Credentials

    credentials = @client.credentials # Get all of your connected credentials
    puts first_account.last.account_created_at
    puts credentials.first.account_identifier

#### Organizations

    @client.invite_user('colby@cloudability.com', name: 'Colby Aley') # Invite a user to your org
    @client.delete_invite(1) # Delete invite 1
    @client.update_invite(103,1) # Update invitation 103 to have role id 1
    @client.my_organization # Get info about your org
    @client.organization_invitations # List invitations for your org
    @client.organization_roles # List roles for your org

#### Budgets

    @client.budgets # List your current budgets

#### Billing Reports

    @client.billing_report # Generate a report of your spend
    @client.billing_report(vendor: 'Amazon', by: 'period')
    @client.billing_report(by: 'vendor')

#### Cost Reports

    @client.cost_reports # List cost reports
    @client.cost_measures # List measures supported by server
    @client.cost_filters # List filters supported by the server

#### Usage Reports

    @client.usage_reports # List usage reports
    @client.usage_measures # List measures supported by server
    @client.usage_filters # List filters supported by the server

## TODO:
  * Better tests!
  * More endpoints!
  * More awesomeness!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
