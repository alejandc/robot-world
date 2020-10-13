require "sidekiq"
require "sidekiq/web"

Sidekiq.configure_server do |config|
  database_config = ActiveRecord::Base.configurations[Rails.env] ||
                Rails.application.config.database_configuration[Rails.env]
  database_config["pool"] = ENV["DB_POOL"] || 5 unless Rails.env.development?

  ActiveRecord::Base.establish_connection(database_config)
end\
