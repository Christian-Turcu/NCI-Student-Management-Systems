#!/bin/bash

# Deployment Script for AWS EC2 (LO2: Cloud Deployment)

echo "Starting deployment process..."

# 1. Update package manager
echo "Updating package manager..."
sudo apt-get update

# 2. Install required dependencies
echo "Installing dependencies..."
sudo apt-get install -y nginx postgresql postgresql-contrib nodejs yarn

# 3. Install Ruby using rbenv
echo "Installing Ruby..."
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc

# 4. Install Ruby version
rbenv install 3.2.2
rbenv global 3.2.2

# 5. Install Bundler
echo "Installing Bundler..."
gem install bundler

# 6. Set up Rails application
echo "Setting up Rails application..."
bundle install
bundle exec rails assets:precompile
bundle exec rails db:migrate RAILS_ENV=production

# 7. Configure Nginx
echo "Configuring Nginx..."
sudo cp config/nginx.conf /etc/nginx/sites-available/student-records
sudo ln -s /etc/nginx/sites-available/student-records /etc/nginx/sites-enabled/
sudo systemctl restart nginx

# 8. Start application server
echo "Starting application server..."
bundle exec puma -C config/puma.rb -e production -d

echo "Deployment completed successfully!"
