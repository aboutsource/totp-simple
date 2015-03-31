# TOTP Simple

This library provides token generation and verification according to https://tools.ietf.org/html/rfc6238

## Installation

Add this line to your application's Gemfile:

    gem 'totp-simple'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install totp-simple

## Usage

Warning, this gems has the name *totp-simple* but the actual library is called
*TOTP*. This is for historical reasons, as we haven't planned to publish this
gem on rubygems.org.

```ruby
require 'totp'

password = TOTP::Password.new('shared-secret').generate

TOTP::Password.new('shared-secret').verify(password)

```

## Testing

    rspec

## Contributing

1. Fork it ( https://github.com/aboutsource/totp-simple/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
