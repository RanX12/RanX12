# frozen_string_literal: true

namespace :deploy do
  desc 'Clean bootsnap cache'
  task clear_bootsnap: [] do
    on roles(:app) do
      execute %(rm -rf "#{shared_path}/tmp/bootsnap-*")
    end
  end
end
after 'deploy:updated', 'deploy:clear_bootsnap'
