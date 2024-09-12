# frozen_string_literal: true

module RailsDataMigrations
  class LogEntry < ::ActiveRecord::Base
    def self.table_name
      ENV.fetch('DATA_MIGRATIONS_TABLE_NAME', 'data_migrations')
    end

    def self.create_table
      schema_migration_instance.create_table
    end

    def self.schema_migration_instance
      connection_pool = ActiveRecord::Tasks::DatabaseTasks.migration_connection_pool
      schema_migration = ActiveRecord::SchemaMigration.new(connection_pool)
      schema_migration.define_singleton_method(:table_name) { LogEntry.table_name }
      schema_migration.instance_variable_set(:@arel_table, Arel::Table.new(LogEntry.table_name))
      schema_migration
    end
  end
end
