namespace :lightcable do
  desc 'Restart ranx12-rtc service'
  task restart: [] do
    on roles(:lightcable) do
      execute %(sudo systemctl restart ranx12-rtc.service)
    end
  end

  desc 'Start ranx12-rtc service'
  task start: [] do
    on roles(:lightcable) do
      execute %(sudo systemctl start ranx12-rtc.service)
    end
  end

  desc 'Stop ranx12-rtc service'
  task stop: [] do
    on roles(:lightcable) do
      execute %(sudo systemctl stop ranx12-rtc.service)
    end
  end

  desc 'Show ranx12-rtc service'
  task status: [] do
    on roles(:lightcable) do
      execute %(sudo systemctl status ranx12-rtc.service)
    end
  end
end
