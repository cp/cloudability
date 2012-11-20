# Cloudability

Ruby wrapper for the Cloudability API using httparty.

## Installation

Add this line to your application's Gemfile:

    gem 'cloudability'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cloudability

## Usage

  Covers endpoints:
  * credentials
  * budgets
  * and partial billing_reports
  

### Credential Endpoint:
  Caputure an array containing all your Cloud Accounts 

    credentials = Cloudability::Credentials.new(:auth_token => 'xxxxxxxxxxxxxxxxxxxx')
    all_credentials = credentials.find_all
    first_account = all_credentials.first

    puts first_account.account_created_at
    puts first_account.account_identifier
    puts first_account.created_at
    puts first_account.has_auth
    puts first_account.has_estimate
    puts first_account.id
    puts first_account.is_duplicate
    puts first_account.nickname
    puts first_account.state
    puts first_account.updated_at
    puts first_account.vendor_id
    puts first_account.vendor_key


## TODO:
  * finish report by and filter by options.
  * Refactor!
  * More Docs!


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
