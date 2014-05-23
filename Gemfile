source 'https://rubygems.org'

# dotenv should be inluded before any other gems that use environment
# variables, otherwise those gems will get initialized with the wrong values.
gem 'dotenv-rails', :groups => [:development, :test]

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.1'

# Use postgresql as the database for Active Record
gem 'pg'

# use postgis
gem 'activerecord-postgis-adapter'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# add geojson support to rgeo
gem 'rgeo-geojson'

# file attachments
gem 'paperclip'
gem 'ruby-filemagic'

# Store file attachments on s3
gem 'aws-sdk'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  gem 'rspec-rails', '~> 2.14.2'
  gem 'pry'
  gem 'ci_reporter'
end

group :test do
  gem 'database_cleaner'
  gem 'vcr', require: false
  gem 'webmock', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
