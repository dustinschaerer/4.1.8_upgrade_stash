 source 'https://rubygems.org'

#ruby '2.0.0'
ruby '2.1.5'

#gem 'rails', '4.0.4'
gem 'rails', '4.1.8'
#gem 'sass-rails', '4.0.1'
gem "sass-rails", "~> 4.0.3"
#gem 'bootstrap-sass', '~>3.0.3.0'
gem 'bootstrap-sass', '~> 3.1.1'
gem 'devise'
gem 'activeadmin', github: 'activeadmin'
#gem 'activeadmin', github: 'gregbell/active_admin', branch: 'master'
#gem 'seed_dump'
#gem 'acts-as-taggable-on'
gem 'pg'
gem 'uglifier', '2.1.1'
gem 'coffee-rails', '~> 4.0.0'
#gem 'jquery-rails', '3.0.4'
gem 'jquery-rails'
gem 'jquery-ui-rails'
#gem 'turbolinks', '2.1'
#gem 'jquery-turbolinks'
# gem 'jbuilder', '1.0.2'
gem 'jbuilder', '~> 2.0'
#gem 'simple_form'
#gem 'country-select'
gem 'underscore-rails'
gem 'dependent-fields-rails'
gem 'bootstrap_form', github: 'bootstrap-ruby/rails-bootstrap-forms'
gem "best_in_place", github: 'bernat/best_in_place'
#gem 'best_in_place', '~> 3.0.1'
gem 'activemerchant'
gem 'figaro'
gem 'passenger'
gem 'newrelic_rpm'
gem 'friendly_id', '~> 5.0.0'
gem 'tilt', '1.4.1'
gem 'asset_sync'
gem 'active_skin'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
#gem 'debugger', group: [:development, :test]

group :development do
  gem 'spring'
end

group :development, :test do
  #gem 'sqlite3', '1.3.8'
  #gem 'rspec-rails', '2.13.1'
  #gem 'guard-rspec', '2.5.0'
  #gem 'spork-rails', '4.0.0'
  #gem 'guard-spork', '1.5.0'
  gem 'childprocess', '0.3.6'
  gem 'factory_girl_rails'
  gem 'bullet'
  gem "brakeman", :require => false
  gem 'rails_best_practices'
end

group :test do
  gem 'selenium-webdriver', '2.35.1'
  gem 'capybara', '2.1.0'
  # uncomment on Linux
  gem 'libnotify', '0.8.0'
  gem 'shoulda'
  gem 'simplecov', :require => false
end

group :doc do
  gem 'sdoc', '0.4.0', require: false
end

group :production do
  gem 'rails_12factor', '0.0.2'
end
