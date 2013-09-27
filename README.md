# YARD::Redcarpet::Ext

Enables Redcarpet extensions 


## Installation

Add this line to your application's Gemfile:

    gem 'yard-redcarpet-ext'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yard-redcarpet-ext

## Usage

Add `--plugin redcarpet-ext` option to your `.yardopts` or call yard with this option.

Create new file named `.redcarpet-ext` and write there all needed Redcarpet extensions like tables.

Another way to specify extensions is setting of YARD_REDCARPET_EXTS environment variable. Extensions should be separated by comma.

You must have `gem 'yard-redcarpet-ext'` string in your Gemfile or development dependency in gemspec if it exists.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request