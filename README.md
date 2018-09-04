# TastyRecipes

  A person can search for recipes by entering ingredients, a course, or a type of meal they want.  This gem will pull all recipe titles from Tasty (tasty.co) matching their search and a person can choose which recipe they'd like to try.  Once the person inputs which recipe, all the required ingredients and instructions will display.

  If a person inputs an invalid search, the program will notify them and restart.  If they input an invalid response from the listed recipes, they will be notified and start a new search.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tasty_recipes'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tasty_recipes

## Usage

  Enter the following and follow the on screen prompts.

    $ tasty_recipes

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/tasty_recipes. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TastyRecipes project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/tasty_recipes/blob/master/CODE_OF_CONDUCT.md).
