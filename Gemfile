source 'https://rubygems.org'

ruby '2.1.2'

# dotenv should be inluded before any other gems that use environment
# variables, otherwise those gems will get initialized with the wrong values.
gem 'dotenv-rails', :groups => [:development, :test]
gem 'foreman'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.6'

# Use postgresql as the database for Active Record
gem 'pg'

# use postgis
gem 'activerecord-postgis-adapter'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
gem 'bootstrap-sass', '~> 2.3.1.3'

# Use haml for markup
gem 'haml-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# add geojson support to rgeo
gem 'rgeo-geojson'

# add devise for authentication
gem 'devise'
gem 'omniauth-twitter'

# authorization
gem 'cancan'

# file attachments
gem 'paperclip'

# Store file attachments on s3
gem 'aws-sdk'

gem 'newrelic_rpm'

gem 'leaflet-rails'
gem 'handlebars_assets'
gem 'momentjs-rails'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  gem 'rspec-rails', '~> 2.14.2'
  gem 'pry'
  gem 'ci_reporter'
  gem 'cucumber-rails', :require => false
  gem 'capybara-webkit'
  gem 'factory_girl_rails'
end

group :test do
  gem 'database_cleaner'
  gem 'vcr', require: false
  gem 'webmock', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
