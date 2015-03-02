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

There are two classes that you will work with in regards to users:
`GroSocial::Users` and `GroSocial::User`. `GroSocial::Users` represents the
class you will use to locate specific users or iterate over them.
`GroSocial::Users` can be treated like a Hash when it comes to accessing and
working with the `GroSocial::User` records.

#### Retrieval

Retrieval is keyed to the ID for the user you want to access.

```ruby
user = GroSocial::Users[1234]   # GroSocial::User

user.id         # '1234'
user.firstname  # 'John'
user.lastname   # 'Doe'
```

#### Creation

The `<<` operation is used to both create and update records and its behavior
is based on whether the `GroSocial::User` being pushed in already has an ID
value set.

```ruby
user = GroSocial::User.new(
    firstname:  'John',
    lastname:   'Doe',
    email:      'johndoe@example.com',
    password:   'secret123'
)
user.id         # nil

GroSocial::Users << user

user.id         # '12345'
```

### Subscriptions

#### Updating

```ruby
user = GroSocial::Users[1234]
subscription = user.subscription # => an instance of GroSocial::Subscription

subscription.canceled = false
subscription.nextpaymentdate = 1.year.from_now
subscription.save
```

### Future-Proofing

TODO: Document how to access resources directly via GroSocial::Client.request

## Contributing

1. Fork it ( https://github.com/[my-github-username]/gro_social/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
