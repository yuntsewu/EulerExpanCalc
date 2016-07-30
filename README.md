# EulerExpanCalc

    1) it will have to parse a text file (csv)
    2) the csv will be 2 columns, all of integers (see attached for a sample)
    3) it will go through all the rows of numbers and it will find the Xth prime number that has Y digits in the expansion of Euler's formula - for example, if 5 and 6 are the current line in the csv, it will show the 5th 6 digit prime number in the expansion. It will continue through the csv and display results for all the numbers.  

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'EulerExpanCalc'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install EulerExpanCalc

## Usage

There are two ways to use this code: 
    


###Example:  
You would need to create "EulerTask" object and call "calculatesNum(path)" method.  
```ruby
calc = EulerTask.new  
print 'Enter File name: '  
fname = STDIN.gets.chomp()  
puts calc.calculatesNum(fname)  
```

Or clone the project and execute 
    
```
$ bin/console  
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/yuntsewu/EulerExpanCalc.
