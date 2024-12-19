#!/bin/bash

# Update system packages
sudo apt-get update
sudo apt-get -y upgrade

# Install required packages
sudo apt-get install -y git curl libssl-dev libreadline-dev zlib1g-dev autoconf bison build-essential libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev nodejs npm

# Install rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc

# Install ruby-build
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

# Install Ruby 3.2.2
~/.rbenv/bin/rbenv install 3.2.2
~/.rbenv/bin/rbenv global 3.2.2

# Install bundler
gem install bundler

# Create application directory
sudo mkdir -p /var/www/student-management-app
sudo chown -R ubuntu:ubuntu /var/www/student-management-app

# Clone your application
cd /var/www/student-management-app
git clone https://github.com/Christian-Turcu/NCI-Student-Management-Systems.git .

# Generate production key
RAILS_ENV=production bundle exec rails credentials:setup

# Install dependencies
bundle config set --local without 'development test'
bundle install

# Setup database
RAILS_ENV=production bundle exec rails db:create
RAILS_ENV=production bundle exec rails db:migrate
RAILS_ENV=production bundle exec rails assets:precompile

# Create systemd service
sudo tee /etc/systemd/system/rails.service << EOF
[Unit]
Description=Rails Server
After=network.target

[Service]
Type=simple
User=ubuntu
WorkingDirectory=/var/www/student-management-app
Environment=RAILS_ENV=production
Environment=PORT=3000
ExecStart=/home/ubuntu/.rbenv/shims/bundle exec rails server -b 0.0.0.0
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Start Rails service
sudo systemctl daemon-reload
sudo systemctl enable rails
sudo systemctl start rails
