# config valid for current version and patch releases of Capistrano
lock "~> 3.16.0"

set :application, 'ranx12'
set :repo_url, 'git@github.com:RanX12/ranx12.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/data/www/ranx12'

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: false

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, 'config/application.yml', 'config/database.yml', 'config/puma.rb'
append :linked_files, 'public/sitemap.xml.gz'

# Default value for linked_dirs is []
append :linked_dirs, 'config/certs'
append :linked_dirs, 'log'
append :linked_dirs, 'node_modules'
append :linked_dirs, 'public/packs', 'public/system', 'public/uploads'
append :linked_dirs, 'tmp/pids', 'tmp/cache', 'tmp/sockets'

# Default shell environment used during command execution.
#
#   * NODE_OPTIONS
#     * max-old-space-size, increasing Node’s Memory to solve `JavaScript heap out of memory`
set :default_env, { NODE_OPTIONS: '--max-old-space-size=8192' }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

# Plugin: capistrano/rbenv
set :rbenv_ruby, '2.7.2'

# Plugin: capistrano/rails
set :rails_env, 'production'
set :assets_roles, [:assets]

# Plugin: capistrano/clockwork
set :clockwork_file, 'config/clock.rb'
set :clockwork_role, :clockwork

# Plugin: capistrano/puma
append :rbenv_map_bins, 'puma', 'pumactl'
set :puma_conf, "#{shared_path}/config/puma.rb"
