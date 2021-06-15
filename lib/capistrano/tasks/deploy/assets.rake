# frozen_string_literal: true

namespace :deploy do
  namespace :assets do
    desc 'Sync assets'
    task sync: [] do
      rsync_options = '--archive --acls --xattrs --delete --verbose'
      assets_role = roles(:assets)[0]

      on roles(:app) do |server|
        next if server.roles.include?(:assets)

        %w(public/assets/ public/packs/).each do |path|
          dst = src = "#{shared_path}/#{path}"
          execute %(rsync #{rsync_options} #{assets_role.hostname}:#{src} #{dst})
        end
      end
    end

    desc 'Upload sourcemaps'
    task upload_sourcemaps: [] do
      on roles(:assets) do
        within release_path do
          with rails_env: fetch(:rails_env) do
            execute :rake, 'sentry:upload_sourcemaps'
          end
        end
      end
    end
  end
end
after 'deploy:assets:precompile', 'deploy:assets:sync'
after 'deploy:finished', 'deploy:assets:upload_sourcemaps'
