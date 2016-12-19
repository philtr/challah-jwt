# Challah JWT

Authenticate your Challah users with JSON Web Tokens (JWT).

## Installation

1. Add this line to your application's Gemfile and then `bundle install`:

```ruby
gem 'challah-jwt'
```

2. In your Challah initializer, add the following line:

```ruby
Challah.register_technique :jwt, Challah::Jwt::Technique
```

3. Include the tokenizer concern in your user model:

```ruby
class User < ApplicationRecord
  include Challah::Userable
  include Challah::Jwt::Tokenizer
end
```

## Usage

You'll need to include the JWT in your sign in response, e.g.:

```JSON
{
  "user": {
    "jwt": "adi8e98uie.saxbbbgudinocgeigc84y9834.8ui9odeion",
    "id": "1",
    "first_name": "Slick",
    "last_name": "McSpeedy",
  }
}
```

Send the JWT in the `Authorization` header like this:

```http
GET /
Authorization: Bearer adi8e98uie.saxbbbgudinocgeigc84y9834.8ui9odeion
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can
also run `bin/console` for an interactive prompt that will allow you to
experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
<https://github.com/philtr/challah-jwt>.

