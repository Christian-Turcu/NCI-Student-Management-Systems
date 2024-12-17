# NCI Management System

A Ruby on Rails application for managing records with SQLite database and AWS EC2 deployment capabilities.

## What I used

- Ruby 3.3.6
- Rails 7.1.0
- SQLite3
- AWS Account for EC2 deployment

## Instructions to launch 

1. Clone the repository
2. Install dependencies:
```bash
bundle install
```

3. Setup the database:
```bash
rails db:migrate
```

4. Start the server:
```bash
rails server
```

5. Visit http://localhost:3000 in your browser

## Testing

Run the test suite:
```bash
rails test
```

## AWS EC2 Deployment

1. Configure AWS credentials in `config/aws.yml`
2. Ensure EC2 security groups allow inbound traffic on port 3000
3. Deploy using Kamal:
```bash
bundle exec kamal deploy
```

## Features

- CRUD operations for records
- Bootstrap-styled responsive UI
- Form validations
- Test coverage
- AWS EC2 deployment support
