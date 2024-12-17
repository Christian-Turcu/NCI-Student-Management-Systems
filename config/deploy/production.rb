# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

# server "example.com", user: "deploy", roles: %w{app db web}, my_property: :my_value
# server "example.com", user: "deploy", roles: %w{app web}, other_property: :other_value
# server "db.example.com", user: "deploy", roles: %w{db}



# role-based syntax
# ==================

# Defines a role with one or multiple servers. The primary server in each
# group is considered to be the first unless any hosts have the primary
# property set. Specify the username and a domain or IP for the server.
# Don't use `:all`, it's a meta role.

# role :app, %w{deploy@example.com}, my_property: :my_value
# role :web, %w{user1@primary.com user2@additional.com}, other_property: :other_value
# role :db,  %w{deploy@example.com}



# Configuration
# =============
# You can set any configuration variable like in config/deploy.rb
# These variables are then only loaded and set in this stage.
# For available Capistrano configuration variables see the documentation page.
# http://capistranorb.com/documentation/getting-started/configuration/
# Feel free to add new variables to customise your setup.



# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult the Net::SSH documentation.
# http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start
#
# Global options
# --------------
#  set :ssh_options, {
#    keys: %w(/home/user_name/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
#
# The server-based syntax can be used to override options:
# ------------------------------------
# server "example.com",
#   user: "user_name",
#   roles: %w{web app},
#   ssh_options: {
#     user: "user_name", # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: "please use keys"
#   }

# Production server configuration
server "54.224.57.91", 
  user: "ec2-user", 
  roles: %w{web app db}, 
  ssh_options: {
    keys: %w(student-app-ec2.pem),
    forward_agent: true,
    auth_methods: %w(publickey),
    verify_host_key: :never
  }

# Production specific settings
set :rails_env, 'production'
set :branch, 'main'
set :deploy_to, "/home/ec2-user/student_management"

# Enable delayed job if using it
# set :delayed_job_workers, 2

# Configure the deployment branch
set :deploy_ref, 'origin/main'

# Configure asset precompilation
set :assets_roles, [:web, :app]

# Configure database
set :migration_role, :db
set :migration_servers, -> { primary(fetch(:migration_role)) }

# Configure the deployment user
set :user, 'ec2-user' 

# Configure SSH options
set :ssh_options, {
  keys: %w(~/.ssh/your_key.pem), 
  forward_agent: false,
  auth_methods: %w(publickey)
}
