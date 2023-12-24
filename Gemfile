source "https://rubygems.org"

ruby "3.2.2"

gem "rails", "~> 7.1.1"
gem "sprockets-rails"
gem "yaml_db"
gem "schema_to_scaffold"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false
gem 'devise', '~> 4.9', '>= 4.9.3'
gem 'jquery-rails', '~> 4.6'
gem 'jquery-ui-rails', '~> 6.0', '>= 6.0.1'
gem "mysql2"


group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
end

group :development do
  gem "mysql2"
  gem "web-console"
end

group :production do
  gem 'pg', '~> 1.5', '>= 1.5.4'
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
