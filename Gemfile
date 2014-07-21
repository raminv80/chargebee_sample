source 'https://rubygems.org'

ruby "2.1.2"
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.2'
# Use sqlite3 as the database for Active Record
gem 'pg'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
group :assets do
  gem 'sass-rails', '~> 4.0.3'
  gem 'coffee-rails', '~> 4.0.0'
  gem 'uglifier', '>= 1.3.0'
end

group :development, :test do
  gem 'pry-rails'
  gem 'spring'
  gem 'quiet_assets'
  gem 'looksee'
  gem 'awesome_print'
  gem "better_errors"
  gem "binding_of_caller"
  gem 'hirb'
end

group :test, :development do
    gem 'rspec-rails', '~> 3.0.0'
end

group :development do
  gem 'rb-readline'
end

gem 'rails_config'

gem 'rails_12factor', group: :production

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
gem 'chargebee'

gem 'omniauth'
gem 'omniauth-mindvalley', '>= 0.0.8', :git => 'git://github.com/mindvalley/omniauth-mindvalley.git'

gem 'rocket_pants', '~> 1.0'
