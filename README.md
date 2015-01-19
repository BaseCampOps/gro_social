# GroSocial

[![Code Climate](https://codeclimate.com/github/BaseCampOps/gro_social/badges/gpa.svg)](https://codeclimate.com/github/BaseCampOps/gro_social)
[![Test Coverage](https://codeclimate.com/github/BaseCampOps/gro_social/badges/coverage.svg)](https://codeclimate.com/github/BaseCampOps/gro_social)
[![Build Status](https://travis-ci.org/BaseCampOps/gro_social.svg)](https://travis-ci.org/BaseCampOps/gro_social)

The gro_social gem provides a Ruby interface to the [GroSocial REST API](https://api.grosocial.com/documentation).
The gem is intended to be lightweight with simple wrappers around the exposed
resources.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gro_social'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gro_social

## Usage

First you need to set your API credentials with the GroSocial::Client.

```ruby
GroSocial::Client.api_key = 'YOUR_KEY'
GroSocial::Client.api_password = 'SECRET'
```

You can enable test mode for the client in a similar fashion.

```ruby
GroSocial::Client.test_mode = true
```

Once these configuration options are set appropriately you are ready to simply
interact with the supported resources.

### Users

TODO: Document the GroSocial::Users API

### Subscriptions

TODO: Document the GroSocial::Subscription API

### Future-Proofing

TODO: Document how to access resources directly via GroSocial::Client.request

## Contributing

1. Fork it ( https://github.com/[my-github-username]/gro_social/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
