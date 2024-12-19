source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 8.0.1"
# The modern asset pipeline for Rails 
gem "propshaft"
# Use sqlite3 as the database for Active Record
gem "sqlite3", ">= 2.1"
# Use the Puma web server 
gem "puma", ">= 5.0"
# Use JavaScript with ESM import maps 
gem "importmap-rails"
# Hotwire's SPA-like page accelerator 
# Hotwire's modest JavaScript framework 
gem "stimulus-rails"
# Build JSON APIs with ease 
gem "jbuilder"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Use the database-backed adapters for Rails.cache, Active Job, and Action Cable
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Deploy this application anywhere as a Docker container 
gem "kamal", require: false

# Add HTTP asset caching/compression and X-Sendfile acceleration to Puma 

# Use Active Storage variants 
group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  # Static analysis for security vulnerabilities 
  gem "brakeman", require: false

  # Omakase Ruby styling 
  gem "rubocop-rails-omakase", require: false
end

group :development do
  # Use console on exceptions pages 
  gem "web-console"

  # Deployment gems
  gem 'capistrano', '~> 3.17'
  gem 'capistrano-rails', '~> 1.6'
  gem 'capistrano-bundler', '~> 2.1'
  gem 'capistrano-passenger', '~> 0.2.1'
  gem 'capistrano-rbenv', '~> 2.2'
  gem "ed25519"
  gem "bcrypt_pbkdf"
end

group :test do
  # Use system testing 
  gem "capybara"
  gem "selenium-webdriver"
end
