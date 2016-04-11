require "active_record"
require "active_record/schema_dumper"

module SchemaDump
  class Dump
    def initialize(database_url:, tables: [], stream: STDOUT)
      @database_url = database_url
      @tables = tables
      @stream = stream
    end

    def call
      dump_schema
    end

    private

    def dump_schema
      with_selected_tables do
        pool.with_connection do |connection|
          ActiveRecord::SchemaDumper.dump(connection, @stream)
        end
      end
    end

    def with_selected_tables
      previous = ActiveRecord::SchemaDumper.ignore_tables
      ActiveRecord::SchemaDumper.ignore_tables = tables_to_ignore

      yield
    ensure
      ActiveRecord::SchemaDumper.ignore_tables = previous
    end

    def tables_to_ignore
      return @tables if @tables.empty?

      /^(?:(?!#{Regexp.union(@tables)}).)*$/
    end

    def pool
      @pool ||= ActiveRecord::Base.establish_connection(@database_url)
    end

    def self.call(attributes = {})
      new(attributes).call
    end
  end
end
