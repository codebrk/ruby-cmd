## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby-cmd'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby-cmd

## Usage

```ruby
require 'ruby/cmd'

class Prompt < CLI::Prompt

  def initialize
    super(Prompt)
    @prompt = "sqweeks > "
  end

  def do_git(line)
    puts "GIT: #{line}"
  end

  def complete_git
    ["push", "commit", "init", "pull", "add"]
  end

  def do_test(line)
    puts "TEST: #{line}"
  end

  def complete_test
    ["hello", "world"]
  end

end

prompt = Prompt.new
prompt.cmd_loop
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ruby-cmd. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

