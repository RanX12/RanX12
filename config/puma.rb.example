app_root = '/data/www/ranx12/shared'
pidfile "#{app_root}/tmp/pids/puma.pid"
state_path "#{app_root}/tmp/pids/puma.state"
bind "unix://#{app_root}/tmp/sockets/puma.sock"
activate_control_app "unix://#{app_root}/tmp/sockets/pumactl.sock"
daemonize true
workers 2
threads 8, 16
prune_bundler
stdout_redirect "#{app_root}/log/puma_access.log", "#{app_root}/log/puma_error.log", true