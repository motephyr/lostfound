source 'https://rubygems.org'
source 'https://rails-assets.org' do
  %w(
    datetimepicker
  ).each do |asset_source|
    gem "rails-assets-#{asset_source}"
  end
end

gem "settingslogic"
gem 'bootstrap-sass', '~> 3.3.4'
gem "bootstrap_helper", ">= 4.2.2.1"
gem "autoprefixer-rails"
gem 'seo_helper', '~> 1.0', :git => 'git://github.com/motephyr/seo_helper.git'
gem 'open_graph_helper'
gem 'slim-rails'

gem "simple_form"
gem 'devise'
gem 'devise-i18n-bootstrap'
gem 'devise-token_authenticatable'
gem "omniauth"
gem "omniauth-facebook"
gem "auto-facebook", git: 'https://github.com/motephyr/auto-facebook.git'

gem 'carrierwave'
gem "mini_magick"

gem 'ransack'
gem 'bootstrap-material-design'

group :production do
  gem 'rails_12factor'
  gem "non-stupid-digest-assets"
  gem "pg"
  gem "fog"
end

group :development do
  gem 'capistrano-bundler', '~> 1.1.2'
  gem "capistrano", '~> 3.2.1'
  gem "capistrano-rails"
  gem "capistrano-rvm"
  gem 'capistrano-bower'
  gem "binding_of_caller"
  gem "better_errors", "~> 0.9.0"

  #gem "pry-stack_explorer"
  #gem "pry-byebug"
  gem "pry-rescue"
  gem "pry-doc"
  gem "pry-docmore"
  gem "pry-rails"
  gem 'awesome_print'

  gem "letter_opener"
  gem 'meta_request'
  gem 'sqlite3'
end

group :test do
  gem 'guard-rspec', require: false
  gem 'rspec-rails', '~> 2.14.1'
  gem 'rails_best_practices'
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

ruby "2.2.1"

