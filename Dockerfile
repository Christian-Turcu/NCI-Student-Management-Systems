# Use Ruby 3.2.2 as base image
FROM ruby:3.2.2-slim AS base

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    build-essential \
    git \
    libsqlite3-dev \
    nodejs \
    && rm -rf /var/lib/apt/lists/*

# Set Rails environment
ENV RAILS_ENV=production \
    BUNDLE_WITHOUT=development:test \
    BUNDLE_DEPLOYMENT=1

# Copy Gemfile and install dependencies
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && \
    bundle config set --local without 'development test' && \
    bundle install

# Copy the application code
COPY . .

# Precompile assets
RUN SECRET_KEY_BASE=dummy bundle exec rails assets:precompile

# Add a script to be executed every time the container starts
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Start the server
EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
