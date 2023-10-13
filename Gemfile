source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

# Core gems
gem "rails"
gem "sprockets-rails"
gem "pg"
gem "puma"
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
end

