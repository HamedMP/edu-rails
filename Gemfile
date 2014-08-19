source 'https://rubygems.org'
ruby '2.1.2'

gem 'rails', '4.1.5'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'slim-rails'
gem 'pg'
gem 'kaminari'
gem 'bootstrap-sass', '~> 3.2.0'
gem 'autoprefixer-rails'
gem 'omniauth-facebook'
gem 'bootsy'
gem 'dalli'
gem 'connection_pool'
gem 'puma'

group :production, :staging do
  gem 'rails_12factor'
  gem 'heroku-deflater'
  gem 'newrelic_rpm'
end

group :development do
  gem 'spring'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'quiet_assets'
  gem 'foreman'
end

group :development, :test do
  gem 'rspec'
  gem 'factory_girl_rails'
  gem 'rspec-rails', '~> 3.0.0'
  gem 'pry-rails'
  gem 'dotenv-rails'
end

group :test do
  gem 'shoulda-matchers', require: false
  gem 'rspec-its'
  gem 'ci_reporter'
  gem 'simplecov'
  gem 'simplecov-csv'
  gem 'rspec_junit_formatter'
end
