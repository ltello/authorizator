# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.

#capistrano
require 'rvm/capistrano'

# Default deploy_to directory is /var/www/my_app
set :deploy_to, "/home/ubuntu/authorizator"

role :app, "majinboo.ideas4all.com"
role :web, "majinboo.ideas4all.com"
role :db,  "majinboo.ideas4all.com"

set :rvm_ruby_string, 'ruby-2.1.0@authorizator'
set :rvm_bin_path, "/usr/local/rvm/bin"

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server definition into the
# server list. The second argument is a, or duck-types, Hash and is
# used to set extended properties on the server.

server 'majinboo.ideas4all.com', user: 'ubuntu', roles: %w{web app}, my_property: :my_value


namespace :rvm do
  desc "Create correct RVM file"
  task :create_rvmrc do
    run "cd /home/ubuntu/authorizator && rvm use 2.1.0@authorizator --rvmrc --create"
  end
end

after "rvm:create_rvmrc", :create_rvmrc


# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult[net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start).
#
# Global options
# --------------
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
#
# And/or per server (overrides global)
# ------------------------------------
# server 'example.com',
#   user: 'user_name',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }
