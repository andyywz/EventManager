source 'https://rubygems.org'

gem 'rails', '3.2.13'

gem 'kaminari'

gem 'activeadmin'
gem 'meta_search', '>= 1.1.0.pre'

group :production do
  gem 'pg'
end

group :development do
  gem 'sqlite3'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'jquery-ui-rails'

gem 'devise'

group :development do
  gem "better_errors"
  gem "binding_of_caller"
end

gem "paperclip", "~> 3.0"
gem "aws-sdk"
gem "figaro"

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

group :development, :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'debugger'
end
