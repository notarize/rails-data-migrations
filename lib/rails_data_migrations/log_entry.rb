# frozen_string_literal: true

module RailsDataMigrations
  class LogEntry < ::ActiveRecord::Base
    def self.table_name
      ENV.fetch("DATA_MIGRATIONS_TABLE_NAME", "data_migrations")
    end

    def self.create_table
      schema_migration = ::ActiveRecord::Base.connection_pool.schema_migration
      schema_migration.define_singleton_method(:table_name) { ::RailsDataMigrations::LogEntry.table_name }
      schema_migration.create_table
    end
  end
end
