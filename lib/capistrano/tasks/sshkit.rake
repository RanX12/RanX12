# frozen_string_literal: true

desc 'Run rake task'
task :rake, [:task] => ['deploy:set_rails_env'] do |_, args|
  if args['task'].nil?
    puts "\n" \
      "\nFailed! You need to specify the 'task' parameter!" \
      "\nUsage: bin/cap <stage> rake[<task>]"
    next
  end

  on roles(:db) do
    within release_path do
      with rails_env: fetch(:rails_env) do
        execute :rake, args['task']
      end
    end
  end
end

desc 'Ssh to the current directory'
task :ssh do
  on roles(:db) do |server|
    command = "cd #{release_path} && exec $SHELL -l"
    exec %(ssh -l #{server.user} #{server.hostname} -p #{server.port || 22} -t 'cd #{release_path}; #{command}')
  end
end

desc 'Open rails console'
task :console do
  on roles(:db) do |server|
    command = "$HOME/.rbenv/bin/rbenv exec bundle exec rails c -e #{fetch(:rails_env)}"
    exec %(ssh -l #{server.user} #{server.hostname} -p #{server.port || 22} -t 'cd #{release_path}; #{command}')
  end
end

desc 'Tailing log files'
task :logs, [:file] => ['deploy:set_rails_env'] do |_, args|
  file = args['file'] || fetch(:rails_env)

  trap('INT') { exit 0 }
  on roles(:db) do
    execute "tail -f #{shared_path}/log/#{file}.log"
  end
end
task :log, [:file] => :logs
