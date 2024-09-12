# frozen_string_literal: true

module RailsDataMigrations
  module SharedMethods
    def table_name
      "#{ActiveRecord::Base.table_name_prefix}#{ENV.fetch('DATA_MIGRATIONS_TABLE_NAME', 'data_migrations')}#{ActiveRecord::Base.table_name_suffix}"
    end

    def index_name
      "#{table_name_prefix}#{ENV.fetch('DATA_MIGRATIONS_INDEX_NAME', 'unique_data_migrations')}#{table_name_suffix}"
    end
  end

  if Gem::Version.new('7.1.0') >= Gem::Version.new(::ActiveRecord.version)
    class LogEntry < ::ActiveRecord::SchemaMigration
      class << self
        include SharedMethods
      end
    end
  else
    class LogEntry < ::ActiveRecord::Base
      class << self
        include SharedMethods
        def create_table
          ::ActiveRecord::SchemaMigration.define_method(:table_name) do
            "#{::ActiveRecord::Base.table_name_prefix}#{ENV.fetch('DATA_MIGRATIONS_TABLE_NAME', 'data_migrations')}#{::ActiveRecord::Base.table_name_suffix}"
          end

          ::ActiveRecord::Base.connection.schema_migration.create_table
        end
      end
    end
  end
end