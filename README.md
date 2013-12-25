[![Build Status](https://travis-ci.org/ColbyAley/cloudability.png?branch=master)](https://travis-ci.org/ColbyAley/cloudability)

Ruby wrapper for the [Cloudability API](http://developers.cloudability.com/).

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
  * Budgets
  * Reporting
  * Organizations (Including invitations and roles.)

Feel free to shoot me an email at colby@cloudability.com if you have any questions or need help.
  
### Credentials
  Retrieve an array containing all your Cloud Accounts.

    credentials = Cloudability::Credentials.new(auth_token: 'xxxxxxxxxxxxxxxxxxxx')
    all_credentials = credentials.find_all

    puts first_account.account_created_at
    puts first_account.account_identifier
    puts first_account.created_at
    puts first_account.has_auth
    puts first_account.has_estimate

### Organizations

    c = Cloudability::Organizations.new(auth_token: 'xxxxxxxxxxxxxxxxxxxx')
    c.invite_user(email: 'colby@cloudability.com', name: 'Colby Aley')
    c.roles
    c.invitations

## TODO:
  * More tests!
  * More endpoints!
  * More awesomeness!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
