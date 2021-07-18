# frozen_string_literal: true

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot. This eager loads most of Rails and
  # your application in memory, allowing both threaded web servers
  # and those relying on copy on write to perform better.
  # Rake tasks automatically ignore this option for performance.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Ensures that a master key has been made available in either ENV["RAILS_MASTER_KEY"]
  # or in config/master.key. This key is used to decrypt credentials (and other encrypted files).
  # config.require_master_key = true

  # Disable serving static files from the `/public` folder by default since
  # Apache or NGINX already handles this.
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  # Compress CSS using a preprocessor.
  # config.assets.css_compressor = :sass

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = false

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  # config.action_controller.asset_host = 'http://assets.example.com'
  if ENV['CDN'].present?
    config.action_controller.asset_host = ENV['CDN']
  end

  # Specifies the header that your server uses for sending files.
  # config.action_dispatch.x_sendfile_header = 'X-Sendfile' # for Apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for NGINX

  # Mount Action Cable outside main process or domain.
  config.action_cable.allowed_request_origins = ["#{ENV['PROTOCOL']}://#{ENV['DOMAIN']}"]
  config.action_cable.worker_pool_size = 8
  # config.action_cable.mount_path = nil
  # config.action_cable.url = 'wss://example.com/cable'
  # config.action_cable.allowed_request_origins = [ 'http://example.com', /http:\/\/example.*/ ]

  # Action Cable log tags
  config.action_cable.log_tags = [->(request) { request.uuid }]

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # Use the lowest log level to ensure availability of diagnostic information
  # when problems arise.
  config.log_level = :info

  # Prepend all log lines with the following tags.
  config.log_tags = [:request_id]

  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new

  # Lograge
  config.lograge.enabled = true
  config.lograge.base_controller_class = ['ActionController::API', 'ActionController::Base']

  config.lograge.keep_original_rails_log = true
  config.lograge.logger = ActiveSupport::Logger.new "#{Rails.root}/log/lograge_#{Rails.env}.log"
  config.lograge.formatter = Lograge::Formatters::Logstash.new

  config.lograge.custom_payload do |controller|
    if controller.respond_to?(:current_user, true)
      uid = controller.send(:current_user)&.id
    elsif controller.respond_to?(:current_admin, true)
      uid = controller.send(:current_admin)&.id
    end

    if controller.respond_to?(:current_team, true)
      tid = controller.send(:current_team)&.id rescue nil
    end

    request = controller.request

    {
      request_id: request.uuid,
      host: request.host,
      ip: request.env['HTTP_X_FORWARDED_FOR'] || request.env['REMOTE_ADDR'],
      ua: request.env['HTTP_USER_AGENT'],
      uid: uid,
      tid: tid,
      sid: request.session&.id&.to_s
    }
  end
  config.lograge.custom_options = lambda do |event|
    payload =
      if event.name == 'perform_action.action_cable'
        { params: event.payload[:data].to_json }.merge(event.payload.slice(:request_id, :host, :ip, :ua, :uid, :sid))
      else
        { params: event.payload[:params].to_json }
      end

    payload
  end

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners.
  config.active_support.deprecation = :notify

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  # Inserts middleware to perform automatic connection switching.
  # The `database_selector` hash is used to pass options to the DatabaseSelector
  # middleware. The `delay` is used to determine how long to wait after a write
  # to send a subsequent read to the primary.
  #
  # The `database_resolver` class is used by the middleware to determine which
  # database is appropriate to use based on the time delay.
  #
  # The `database_resolver_context` class is used by the middleware to set
  # timestamps for the last write to the primary. The resolver uses the context
  # class timestamps to determine how long to wait before reading from the
  # replica.
  #
  # By default Rails will store a last write timestamp in the session. The
  # DatabaseSelector middleware is designed as such you can define your own
  # strategy for connection switching and pass that into the middleware through
  # these configuration options.
  # config.active_record.database_selector = { delay: 2.seconds }
  # config.active_record.database_resolver = ActiveRecord::Middleware::DatabaseSelector::Resolver
  # config.active_record.database_resolver_context = ActiveRecord::Middleware::DatabaseSelector::Resolver::Session
end
