source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

# Core gems
gem "rails"
gem "sprockets-rails"
gem "pg"
gem "puma", "< 5.0"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false

# Styling & JavaScript
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "sassc-rails"
gem "slim-rails"
gem 'bootstrap', '~> 5.3.1'

# ActiveStorage
gem "image_processing", "~> 1.2"

# Additional gems
gem "devise"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"

  # Deployment
  gem 'capistrano', '< 5'
  gem 'capistrano-rvm'
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano3-puma', '< 5', group: :development
  gem 'capistrano3-nginx'
  gem 'capistrano-rails-console'
  gem 'capistrano-rails-tail-log'
  gem 'capistrano-rails-db'
  gem 'capistrano-rake', require: false
end

gem 'net-ssh', "7.0.0.betal"
gem 'ed25519', '>= 1.2', '< 2.0'
gem 'bcrypt_pbkdf', '>= 1.0', '< 2.0'