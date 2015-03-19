# WebdriverStatistics

This gem will collect counts and times for each selenium command your code issues.
The statistics are collected between the creation of and quitting of the Driver
When the Driver is closed a formatted string of output is sent to stdout

## Usage

When gem is required, statistics output will be sent to stdout on each driver close
If additional debugging information is desired, set ENV['SE_DEBUG'] = true

## Contributing

1. Fork it ( https://github.com/[my-github-username]/webdriver_statistics/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Copyright

Copyright (c) 2015 Titus Fortner. See LICENSE for details.
