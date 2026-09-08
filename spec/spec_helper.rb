# frozen_string_literal: true

require 'rails/generators'
require 'rake'
require 'rspec/sorbet'

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'rails-data-migrations'

class Module
  include T::Sig
end

ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: ':memory:'

RSpec.configure do |config|
  config.raise_errors_for_deprecations!

  config.before(:all) do
    RailsDataMigrations::LogEntry.create_table
  end

  config.before(:each) do
    RailsDataMigrations::LogEntry.delete_all

    # stub migrations folder
    allow(RailsDataMigrations::Migrator).to receive(:migrations_paths).and_return(['spec/db/data-migrations'])

    # remove migration files
    `rm -rf spec/db/data-migrations`

    ENV['VERSION'] = nil
  end
end

