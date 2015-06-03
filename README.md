# NthDay

[![Build Status](https://travis-ci.org/dmur/nth-day.svg?branch=master)](https://travis-ci.org/dmur/nth-day) [![Coverage Status](https://coveralls.io/repos/dmur/nth-day/badge.svg?branch=master)](https://coveralls.io/r/dmur/nth-day?branch=master) 

A bite-size gem for finding the next occurrence of the *n*th *week*day of the month.  For example, you can use it to find the next "2nd Monday" that will occur. 

## Installation

Add this line to your application's Gemfile:

    gem 'nth_day'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nth_day

## Usage

Find the next occurrence of the nth day specified:

    NthDay.next_occurrence("1st Tuesday") 

You can also pass in a custom value for the date to start from if you don't want to find the next date from today:

    NthDay.next_occurrence("1st Tuesday", Date.today - 1) 

NthDay can handle abbreviated weekday names, and is case-insensitive.  As long as your name has the first two characters of the name, NthDay will recognize it:

    NthDay.next_occurrence("1st Tu")

## Testing

NthDay uses [RSpec](http://rspec.info) for testing.  To run the tests:

    $ bundle exec rspec

## Contributing

1. Fork it ( https://github.com/dmur/nth-day/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


