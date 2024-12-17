# config valid for current version and patch releases of Capistrano
lock "~> 3.19.2"

set :application, "student_management"
set :repo_url, "https://github.com/Christian-Turcu/NCI-Student-Management-System.git"

# Default branch is :master
set :branch, 'main'

# Deploy to the user's home directory
set :deploy_to, "/home/ec2-user/#{fetch(:application)}"

# Default value for :format is :airbrussh
set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/database.yml", "config/master.key"

# Default value for linked_dirs is []
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads', 'storage'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Only keep the last 5 releases to save space
set :keep_releases, 5

# SSH Options
set :ssh_options, {
  keys: ['student-app-ec2.pem'],
  forward_agent: true,
  auth_methods: %w(publickey),
  verify_host_key: :never
}

# Rails Environment
set :rails_env, 'production'

# Passenger settings
set :passenger_restart_with_touch, true

namespace :deploy do
  desc 'Install dependencies and prepare server'
  task :install_dependencies do
    on roles(:app) do
      execute :sudo, 'yum update -y'
      execute :sudo, 'yum install -y git ruby ruby-devel make gcc gcc-c++ postgresql-devel nodejs'
      execute :sudo, 'gem install bundler'
    end
  end

  desc 'Create required directories'
  task :create_directories do
    on roles(:app) do
      execute :sudo, "mkdir -p #{shared_path}/config"
      execute :sudo, "chown -R ec2-user:ec2-user #{deploy_to}"
    end
  end

  desc 'Setup Nginx and Passenger'
  task :setup_nginx do
    on roles(:app) do
      execute :sudo, 'dnf install -y nginx'
      execute :sudo, 'systemctl enable nginx'
      execute :sudo, 'systemctl start nginx'
    end
  end

  before 'deploy:check', 'deploy:install_dependencies'
  before 'deploy:starting', 'deploy:create_directories'
  before 'deploy:starting', 'deploy:setup_nginx'

  # Copy database.yml during deployment
  before 'deploy:check:linked_files', :copy_database_yml do
    on roles(:app) do
      upload! 'config/database.production.yml', "#{shared_path}/config/database.yml"
    end
  end

  # Copy master.key during deployment
  before 'deploy:check:linked_files', :copy_master_key do
    on roles(:app) do
      upload! 'config/master.key', "#{shared_path}/config/master.key"
    end
  end
end
