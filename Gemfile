source 'https://rubygems.org'

gem 'rails', '3.2.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'uglifier', '>= 1.0.3'
end

gem 'sass-rails',   '~> 3.2.3'
gem 'coffee-rails', '~> 3.2.1'
gem 'jquery-rails'

# devise for auth, activeadmin for admin auth, grape for entities
gem 'devise'
gem 'activeadmin'
gem 'meta_search', '>= 1.1.0.pre'
gem 'grape', :git => 'git://github.com/intridea/grape.git'
gem 'grape-swagger', :git => 'git://github.com/tim-vandecasteele/grape-swagger.git'

group :development, :test do
  gem 'rb-fsevent'               # Guards uses this to look for file changes on OSX
  gem 'terminal-notifier-guard'  # This is if you are using Mac OS X Mountain Lion
  gem "rspec-rails"
  gem 'shoulda-matchers'
  gem 'rack-test'
  gem 'coolline'                 # readline support for guard.
  gem 'rb-fsevent'
  gem 'guard'
  gem 'guard-rspec'
end