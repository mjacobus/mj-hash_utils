# Mj::HashUtils

Hash utilities for ruby.

[![Ruby](https://github.com/mjacobus/mj-hash_utils/actions/workflows/main.yml/badge.svg)](https://github.com/mjacobus/mj-hash_utils/actions/workflows/main.yml)
[![Coverage Status](https://coveralls.io/repos/github/mjacobus/mj-hash_utils/badge.svg?branch=main)](https://coveralls.io/github/mjacobus/mj-hash_utils?branch=main)
[![Maintainability](https://api.codeclimate.com/v1/badges/00f72012cd67ae53b273/maintainability)](https://codeclimate.com/github/mjacobus/mj-hash_utils/maintainability)

## Installation

    $ bundle add mj-hash_utils

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install mj-hash_utils

## Usage

```ruby
hash = HashUtils.new

hash.filter_keys(hash, *keys)
hash.deep_symbolize_keys(hash)
hash.deep_stringify_keys(hash)
hash.compact(hash)

hash.deep_transform_keys(hash) do |key|
  "user_#{key}"
end

hash.deep_modify_value(hash) do |value|
  "#{value} + #{value}"
end

hash.normalize_json_keys(hash) # camel case to snakeCase
hash.underscorize_keys(hash, &block)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mjacobus/mj-hash_utils. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/mjacobus/mj-hash_utils/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the `Mj::HashUtils` project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/mjacobus/mj-hash_utils/blob/main/CODE_OF_CONDUCT.md).
