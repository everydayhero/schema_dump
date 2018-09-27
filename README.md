# SchemaDump

Export any database to an ActiveRecord::Schema format.

## Installation

This gem isn't released on RubyGems which means you will need to build it
yourself if you want to use it locally.

```
$ brew install libpq
```

```ruby
$ bundle install
$ bin/rake install:local
```

if `pg` fails to install then try:
```
env ARCHFLAGS="-arch x86_64" gem install pg
```

## Command Line Usage

```
# Export all tables in a given database
$ schema_dump dump postgres://localhost/reporting_store > \
    reporting_store_schema.rb

# Export a selection of tables in a given database
$ schema_dump dump postgres://localhost/reporting_store \
    --tables financial_donations,financial_donors  > \
    reporting_store_schema.rb
```

## Docker Usage

The latest version is available at quay.io/everydayhero/schema-dump:

```
$ docker run quay.io/everydayhero/schema-dump:latest dump \
    postgres://some.address/reporting_store > reporting_store_schema.rb
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake spec` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/everydayhero/schema_dump.
