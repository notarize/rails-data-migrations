# frozen_string_literal: true

ruby_version = Gem::Version.new(RUBY_VERSION)

if ruby_version >= Gem::Version.new('3.1.0')
  appraise 'rails-7.2' do
    gem 'rails', '~> 7.2.0'
    gem 'sqlite3', '~> 1.4.0'
    gem 'sorbet-runtime'
  end
end
